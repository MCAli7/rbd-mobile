import 'package:flutter/material.dart';
import 'package:rbd_mobile/screens/tutor_screen/tutor_screen.dart';
import 'package:rbd_mobile/screens/store_screen/store_screen.dart';
import 'package:rbd_mobile/screens/konseling_screen/konseling_screen.dart';
import 'package:rbd_mobile/screens/settings_screen/settings_screen.dart'; // Add your settings screen import

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the respective screen based on the selected index
    switch (index) {
      case 1: // Tutor
        Navigator.pushNamed(context, TutorScreen.routeName);
        break;
      case 2: // Store
        Navigator.pushNamed(context, StoreScreen.routeName);
        break;
      case 3: // Konseling
        Navigator.pushNamed(context, KonselingScreen.routeName);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
           IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          // Navigate to settings screen
                          Navigator.pushNamed(context, SettingsScreen.routeName);
                        },
                      ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section with greeting, progress bar, and settings icon
            Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [Color(0xFF357A77), Color(0xFF357A77)], // Gradient background
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40), // Adjust as per your status bar height
                  Text(
                    'Selamat datang,',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Mochamad Taufik Ali S A',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Align(
                  //     alignment: Alignment.topRight,
                  //     child: IconButton(
                  //       icon: Icon(
                  //         Icons.settings,
                  //         color: Colors.white,
                  //         size: 28,
                  //       ),
                  //       onPressed: () {
                  //         // Navigate to settings screen
                  //         Navigator.pushNamed(context, SettingsScreen.routeName);
                  //       },
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  Spacer(), //

                  // Progress bar section
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Siswa Eligible',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              '70% | Selesaikan misi untuk meraih badge eligible',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bottom section with tiles and wallet section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  // Titles and numbers (horizontal list)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return Column(
                        children: const [
                          Text(
                            'Title',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Number',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF357A77),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 30),
                  // Wallet section with background image and coins
                  Stack(
                    children: [
                      // Background Image
                      Container(
                        width: double.infinity,
                        height: 160, // Adjusted height for new layout
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/images/Home 1.png'), // Add your image path here
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Wallet content
                      Container(
                        padding: EdgeInsets.all(16.0),
                        height: 160, // Adjusted height to match the new content layout
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left side with points and button
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your wallet',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF357A77), // Use greenish color for contrast
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '500 pts',
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF357A77), // Use greenish color for contrast
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(10, 167, 120, 1.000), // New button color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  // Action for check points button
                                },
                                icon: Image.asset(
                                  'assets/images/iconlogin.png', // Add your icon image path here
                                  height: 20,
                                  width: 20,
                                ),
                                label: Text(
                                  'Cek point',
                                  style: TextStyle(color: Colors.white), // Set text color to white
                                ),
                              ),
                              ],
                            ),
                            // Right side for coins (Image)
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tutor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Konseling',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(242, 167, 57, 1.000), // The selected menu item color
        unselectedItemColor: Color.fromRGBO(242, 167, 57, 1.000), // The unselected menu item color
        onTap: _onItemTapped,
      ),
    );
  }
}
