import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:rbd_mobile/screens/home_screen/home_screen.dart'; // Import the HomeScreen

class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // White background
          Container(
            color: Colors.white, // Set the background color to white
          ),

          // Background Image in the center
          Center(
            child: Image.asset(
              'assets/images/background.png', // Path to your center background image
              fit: BoxFit.cover, // Change to cover to fill the available space
              width: MediaQuery.of(context).size.width, // Use full width
              height: MediaQuery.of(context).size.height, // Use full height
            ),
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Decrease the height to move the text up
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),

                // Welcome Text with custom font (Poppins or similar)
                Text(
                  'Selamat Datang\nSobat RBD,',
                  style: GoogleFonts.poppins(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800, // Bold
                    color: Color(0xFF357A77), // Custom green color
                  ),
                ),

                SizedBox(height: 10),

                // Instruction Text
                Text(
                  'Silahkan masukan Nomer Induk Siswa (NIS) yang sudah anda miliki.',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600], // Grey instruction text
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  'NIS',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    color: Colors.grey[600], // Grey instruction text
                  ),
                ),
                SizedBox(height: 3),

                // NIS Input Field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Input here',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Input here',
                  ),
                ),
                SizedBox(height: 20),

                // Login Button aligned to the right
                Align(
                  alignment: Alignment.centerRight, // Align to the right
                  child: SizedBox(
                    width: 100, // Adjust the width to make the button smaller
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Adjust padding for a smaller button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Slightly smaller radius
                        ),
                        backgroundColor: Color.fromRGBO(10, 167, 120, 1.000), // Custom button color using #357A77
                      ),
                      onPressed: () {
                        // Handle Login with transition to HomeScreen
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(), // Navigate to HomeScreen
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0); // Start from the right
                              const end = Offset.zero; // End at the center
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              
                              // Create the fade transition
                              var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: FadeTransition(
                                  opacity: fadeAnimation,
                                  child: child,
                                ),
                              );
                            },
                          ),
                        );
                      },
                      // Center the text with the image on the right
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center align the text and image
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18.0, // Reduce font size for smaller button
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8), // Add some spacing between text and image
                          Image.asset(
                            'assets/images/iconlogin.png', // Path to your button image
                            height: 20, // Adjust height as needed
                            width: 20, // Adjust width as needed
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
