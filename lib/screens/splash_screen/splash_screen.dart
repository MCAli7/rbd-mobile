import 'package:flutter/material.dart';
import 'package:rbd_mobile/screens/login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  // Route name for our screen
  static String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use future to go from one screen to another via duration time
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to the login screen with a fade and slide transition
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0); // Start from the bottom
            const end = Offset.zero; // End at the center
            const curve = Curves.easeInOut;

            // Create the slide transition
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
        (route) => false,
      );
    });

    // Scaffold color set to primary color in main in our text theme
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center Row content
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center Column content
              children: [
                // Display your image here 
                Image.asset(
                  'assets/images/1_4.gif', // Path to your image file
                  width: MediaQuery.of(context).size.width, // Set image width
                  height: MediaQuery.of(context).size.height, // Set image height
                  fit: BoxFit.cover, // Fit the image properly
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
