import 'package:flutter/material.dart';
import 'package:rbd_mobile/constants.dart';
import 'package:rbd_mobile/routes.dart';
import 'package:rbd_mobile/screens/splash_screen/splash_screen.dart';
import 'package:rbd_mobile/screens/home_screen/home_screen.dart';
import 'package:rbd_mobile/screens/tutor_screen/tutor_screen.dart';
import 'package:rbd_mobile/screens/store_screen/store_screen.dart';
import 'package:rbd_mobile/screens/konseling_screen/konseling_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  //this widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Mobile RBD',
      //we will use light theme for our app.
      theme: ThemeData.light().copyWith(
        //scaffold default color
        scaffoldBackgroundColor: const Color.fromARGB(255, 253, 253, 253),
        primaryColor: kPrimaryColor
        //use google fonts for our app, we will use sourceSansPro
      ),
       // Initial route is SplashScreen
      initialRoute: SplashScreen.routeName,  // Use SplashScreen as the initial screen
      // Define the routes for navigation
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(), // Add SplashScreen route
        HomeScreen.routeName: (context) => const HomeScreen(),
        TutorScreen.routeName: (context) => const TutorScreen(),
        StoreScreen.routeName: (context) => const StoreScreen(),
        KonselingScreen.routeName: (context) => const KonselingScreen(),
        ...routes, // If you have additional routes in the routes file, spread them here
      }, 
    );
  }
}
