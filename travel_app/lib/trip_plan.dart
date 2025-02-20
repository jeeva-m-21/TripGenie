import 'package:flutter/material.dart';

class TripPlanPage extends StatefulWidget {
  const TripPlanPage({super.key});

  @override
  _TripPlanPageState createState() => _TripPlanPageState();
}

class _TripPlanPageState extends State<TripPlanPage> {
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  final List<String> preferences = ['Adventure', 'Relaxation', 'Luxury', 'Solo Travel'];
  String selectedPreference = 'Adventure';

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    budgetController.dispose();
    destinationController.dispose();
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Trip Plan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter Trip Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Destination Input
            TextField(
              controller: destinationController,
              decoration: const InputDecoration(labelText: 'Destination'),
            ),

            // Budget Input
            TextField(
              controller: budgetController,
              decoration: const InputDecoration(labelText: 'Budget'),
              keyboardType: TextInputType.number,
            ),

            // Duration Input
            TextField(
              controller: durationController,
              decoration: const InputDecoration(labelText: 'Duration (days)'),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),

            // Preferences Dropdown
            const Text('Preferences:', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedPreference,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPreference = newValue!;
                });
              },
              items: preferences.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Plan Trip Button
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Trip Plan Finalized'),
                    content: Text(
                      'Your trip to ${destinationController.text} has been planned with a budget of \$${budgetController.text} for ${durationController.text} days.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          Navigator.pop(context); // Go back to HomePage
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Plan Trip'),
            ),
          ],
        ),
      ),
    );
  }
}
