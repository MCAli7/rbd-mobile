import 'package:flutter/material.dart';

class KonselingScreen extends StatelessWidget {
  const KonselingScreen({super.key});
  static String routeName = 'KonselingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Konseling',
          style: TextStyle(color: Colors.white), // Title text color is white
        ),
        backgroundColor: const Color(0xFF357A77), // Set AppBar background color
        iconTheme: const IconThemeData(
          color: Colors.white, // Set AppBar icon color to white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the left
          children: [
            // Booking Section (Text)
            GestureDetector(
              onTap: () {
                // You can add navigation to the booking section here if needed
              },
              child: const Text(
                'Booking Konseling',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Session Card like in the image
            buildDetailCard(
              context,
              'Alifia Rizki Farhani',
              '01 October 2024',
              '13:00 - 14:00',
              'Scheduled on: 2024-10-01 from 13:00 until 14:00',
              Colors.blue,
            ),
             buildDetailCard(
              context,
              'Alifia Rizki Farhani',
              '01 October 2024',
              '13:00 - 14:00',
              'Scheduled on: 2024-10-01 from 13:00 until 14:00',
              Colors.blue,
            ),
             buildDetailCard(
              context,
              'Alifia Rizki Farhani',
              '01 October 2024',
              '13:00 - 14:00',
              'Scheduled on: 2024-10-01 from 13:00 until 14:00',
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the session card with details like the image
  Widget buildDetailCard(BuildContext context, String name, String date, String time, String fullDetails, Color titleColor) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the name
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_image.png'), // Placeholder for image
                  radius: 25,
                ),
                const SizedBox(width: 16),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Date and time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tuesday, $date',
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Schedule details
            Text(
              fullDetails,
              style: TextStyle(fontSize: 14, color: Colors.grey[900]),
            ),
            const SizedBox(height: 16),

            // Book Now button
           Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(10, 167, 120, 1.000), // Button color
                    ),
                    onPressed: () {
                      // Add your booking logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Session booked successfully!')),
                      );
                    },
                    child: const Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white), // Set text color to white
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
