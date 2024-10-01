import 'package:flutter/material.dart';

class TutorScreen extends StatelessWidget {
  static const String routeName = 'TutorScreen';

  const TutorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // Light background color
      appBar: AppBar(
        title: const Text(
          'Review Guru Pelajaran',
          style: TextStyle(color: Colors.white), // Title text color is white
        ),
        backgroundColor: const Color(0xFF357A77), // AppBar background color
        iconTheme: const IconThemeData(
          color: Colors.white, // Icon color set to white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.calendar_today, color: Colors.black),
                  label: const Text(
                    '24/09/2024',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    // Add Date Picker functionality here
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // List of Tutors
            Expanded(
              child: ListView(
                children: [
                  buildTutorCard(
                    tutorName: 'Mamat Arohman',
                    time: '15:30',
                    status: 'Finished',
                    reviewed: true,
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build each tutor review card
  Widget buildTutorCard({
    required String tutorName,
    required String time,
    required String status,
    bool reviewed = false,
    required BuildContext context,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tutor Name
                Text(
                  tutorName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),

                // Time
                Text('Jam: $time'),
              ],
            ),

            // Status and Dropdown Icon
            Column(
              children: [
                // Status with background color
                Chip(
                  label: Text(
                    status,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: status == 'Finished'
                      ? Colors.green
                      : Colors.orange,
                ),
                // Dropdown or Review button
                reviewed
                    ? DropdownButton<String>(
                        value: 'Detail',
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onChanged: (String? newValue) {
                          if (newValue == 'Detail') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  tutorName: tutorName,
                                  time: time,
                                  status: status,
                                ),
                              ),
                            );
                          }
                        },
                        items: <String>['Detail']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    : IconButton(
                        onPressed: () {
                          // Add functionality to mark as reviewed
                        },
                        icon: const Icon(Icons.check, color: Colors.green),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// New Details Screen
class DetailsScreen extends StatelessWidget {
  final String tutorName;
  final String time;
  final String status;

  const DetailsScreen({
    super.key,
    required this.tutorName,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor Details'),
        backgroundColor: const Color(0xFF357A77),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tutor Name: $tutorName',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Time: $time',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Status: $status',
              style: TextStyle(
                fontSize: 16,
                color: status == 'Finished' ? Colors.green : Colors.orange,
              ),
            ),
            const SizedBox(height: 24),
            // Additional details about the tutor can be added here
            const Text(
              'Additional information about the tutor or review can be displayed here.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
