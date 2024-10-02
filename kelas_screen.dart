// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class KelasScreen extends StatelessWidget {
  static const String routeName = 'KelasScreen';

  const KelasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review Guru Pelajaran',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF357A77),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Review Guru Pelajaran',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF357A77),
                ),
              ),
              const SizedBox(height: 20),
              buildDatePicker(context),
              const SizedBox(height: 20),
              // Teacher List
              buildTeacherCard(
                teacherName: 'Esti Saptarini',
                time: '15:30',
                status: 'On Going',
              ),
              buildTeacherCard(
                teacherName: 'Irawan Lesmana',
                time: '17:00',
                status: 'Ready',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Date Picker Widget
  Widget buildDatePicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '02/10/2024', // This can be updated to be dynamic
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {
            // You can implement the date picker logic here
          },
          icon: const Icon(Icons.calendar_today, color: Colors.grey),
        ),
      ],
    );
  }

  // Teacher Card Widget with Dropdown for Status
  Widget buildTeacherCard({
    required String teacherName,
    required String time,
    required String status,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isExpanded = false;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guru: $teacherName',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Jam: $time'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: 14,
                            color: status == 'On Going'
                                ? Colors.orange
                                : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isExpanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                if (isExpanded)
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'More information about the status and teacher goes here.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
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
      initialRoute: KelasScreen.routeName,
      routes: {
        KelasScreen.routeName: (context) => const KelasScreen(),
      },
    );
  }
}
