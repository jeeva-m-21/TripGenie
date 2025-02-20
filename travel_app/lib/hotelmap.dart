import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HotelMapScreen(),
    );
  }
}

class HotelMapScreen extends StatefulWidget {
  @override
  _HotelMapScreenState createState() => _HotelMapScreenState();
}

class _HotelMapScreenState extends State<HotelMapScreen> {
  List<Marker> hotelMarkers = [];
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchHotels();
  }

  Future<void> fetchHotels() async {
    final overpassQuery = """
      [out:json];
      (
        node["tourism"="hotel"](around:50000, 48.8566, 2.3522); // 50km radius around Paris
      );
      out;
    """;
    final url = Uri.parse('https://overpass-api.de/api/interpreter?data=${Uri.encodeComponent(overpassQuery)}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['elements'] == null || (data['elements'] as List).isEmpty) {
          setState(() {
            errorMessage = 'No hotels found. Try again later.';
          });
          return;
        }
        List<Marker> markers = (data['elements'] as List).map((hotel) {
          return Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(hotel['lat'], hotel['lon']),
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40.0,
            ),
          );
        }).toList();
        setState(() {
          hotelMarkers = markers;
          errorMessage = '';
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load hotels. Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching hotels: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hotels Map')),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(48.8566, 2.3522), // Centered in Paris
              initialZoom: 10.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: hotelMarkers,
              ),
            ],
          ),
          if (errorMessage.isNotEmpty)
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}