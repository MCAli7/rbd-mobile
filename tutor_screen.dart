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
          'Portal Tutorial',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Title text color
        ),
        backgroundColor: const Color(0xFF357A77), // AppBar background color
        centerTitle: true, // Center the title
        elevation: 0, // No shadow for a clean look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for branches
            DropdownButtonFormField<String>(
              value: 'Bengawan 69 (anda sedang di cabang ini)',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: (String? newValue) {
                // Handle change
              },
              items: <String>[
                'Bengawan 69 (anda sedang di cabang ini)',
                'Bali 15',
                'Cimanuk',
                'Online',
                'RBDDigital Head Office'
                'Bali 15 SMP'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),

            // List of Tutors
            Expanded(
              child: ListView(
                children: [
                  buildTutorCard(
                    tutorName: 'Anggia Rahmania',
                    subject: 'LID',
                    time: '15:30',
                    day: 'Wednesday',
                    date: '10-02',
                    activeStudents: 0,
                    context: context,
                  ),
                  buildTutorCard(
                    tutorName: 'Tohir',
                    subject: 'MAT',
                    time: '16:00',
                    day: 'Wednesday',
                    date: '10-02',
                    activeStudents: 2,
                    context: context,
                  ),
                  buildTutorCard(
                    tutorName: 'Judi Gunawan',
                    subject: 'MAT',
                    time: '17:00',
                    day: 'Thursday',
                    date: '11-02',
                    activeStudents: 1,
                    context: context,
                  ),
                  buildTutorCard(
                    tutorName: 'Siti Salma',
                    subject: 'BIO',
                    time: '15:00',
                    day: 'Wednesday',
                    date: '10-02',
                    activeStudents: 0,
                    context: context,
                  ),
                  buildTutorCard(
                    tutorName: 'Agustinus Wikyanto Elda Irawan',
                    subject: 'KIM',
                    time: '16:00',
                    day: 'Wednesday',
                    date: '10-02',
                    activeStudents: 0,
                    context: context,
                  ),
                  buildTutorCard(
                    tutorName: 'Hermie Arfianty',
                    subject: 'KIM',
                    time: '15:00',
                    day: 'Thursday',
                    date: '11-02',
                    activeStudents: 0,
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

  // Method to build each tutor card with dropdown (ExpansionTile)
  Widget buildTutorCard({
    required String tutorName,
    required String subject,
    required String time,
    required String day,
    required String date,
    required int activeStudents,
    required BuildContext context,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(tutorName),
        subtitle: Text(subject),
        iconColor: Colors.blue, // Color of the arrow icon
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jam: $time'),
                  Text('Hari: $day'),
                  Text('Tanggal: $date'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Aktif: $activeStudents Siswa',
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the "Mulai Tutor" button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(10, 167, 120, 1.000),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 8.0,
                      ),
                    ),
                    child: const Text(
                    'Mulai Tutor',
                    style: TextStyle(color: Colors.white), // Changed to white tex
                  ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TutorScreen(),
    );
  }
}
