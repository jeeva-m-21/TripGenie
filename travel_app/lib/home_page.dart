import 'package:flutter/material.dart';
import 'trip_plan.dart';
import 'hotelmap.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Planner Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double budgetValue = 5000;
  List<String> preferences = ['Adventure', 'Relaxation', 'Luxury', 'Solo Travel'];
  String selectedPreference = 'Adventure';

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Planner Pro')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWelcomeSection(),
            _buildTripPlanningSection(context),
            _buildCustomPlanningSection(),
            _buildAISuggestionsSection(),
            _buildReelsSection(),
            _buildTravelGuideSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Where to next?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search destination...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripPlanningSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Plan Your Full Trip',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Start New Trip Plan'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TripPlanPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFeatureButton(Icons.flight, 'Flights', 'Flight Booking coming soon!'),
                 _buildFeatureButton1(context, Icons.hotel, 'Hotels', HotelMapScreen()),
                  _buildFeatureButton(Icons.restaurant, 'Food', 'Food Suggestions coming soon!'),
                  _buildFeatureButton(Icons.map, 'Activities', 'Activities Suggestions coming soon!'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomPlanningSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Custom Trip Planning',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('Budget Range: \$${budgetValue.toInt()}'),
              Slider(
                min: 0,
                max: 10000,
                divisions: 10,
                label: '\$${budgetValue.toInt()}',
                value: budgetValue,
                onChanged: (value) {
                  setState(() {
                    budgetValue = value;
                  });
                },
              ),
              Wrap(
                spacing: 8,
                children: preferences.map((pref) {
                  return ChoiceChip(
                    label: Text(pref),
                    selected: selectedPreference == pref,
                    onSelected: (selected) {
                      setState(() {
                        selectedPreference = pref;
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAISuggestionsSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI Trip Enhancements',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _showAlert(
                  'AI Enhancements',
                  'AI will provide personalized trip recommendations and weather-optimized plans!',
                ),
                child: const Text('Get AI Suggestions'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReelsSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Travel Reels',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Icon(Icons.play_circle_fill, size: 50),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('User Experience #${index + 1}'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravelGuideSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Smart Travel Guide',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
             _buildGuideButton(Icons.security, 'Safety Tips', 'https://morth.nic.in/road-safety'),
              _buildGuideButton(Icons.language, 'Cultural Etiquette', 'https://adventureswithsarah.net/travel-etiquette/'),
              _buildGuideButton(Icons.alt_route, 'Terms And Conditions', 'https://www.google.com/help/terms_maps/'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureButton(IconData icon, String text, String message) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 32),
          onPressed: () => _showAlert(text, message),
        ),
        Text(text),
      ],
    );
  }
  Widget _buildFeatureButton1(BuildContext context, IconData icon, String text, Widget page) {
  return Column(
    children: [
      IconButton(
        icon: Icon(icon, size: 32),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
      Text(text),
    ],
  );
}


Widget _buildGuideButton(IconData icon, String title, String url) {
  return GestureDetector(
    onTap: () async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    },
    child: Column(
      children: [
        Icon(icon, size: 50, color: Colors.blue),
        Text(title, style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}

}
  
