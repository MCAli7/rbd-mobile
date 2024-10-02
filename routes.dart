import 'package:rbd_mobile/screens/login_screen/login_screen.dart';
import 'package:rbd_mobile/screens/home_screen/home_screen.dart';
import 'package:rbd_mobile/screens/splash_screen/splash_screen.dart';
import 'package:rbd_mobile/screens/tutor_screen/tutor_screen.dart';
import 'package:rbd_mobile/screens/store_screen/store_screen.dart';
import 'package:rbd_mobile/screens/konseling_screen/konseling_screen.dart';
import 'package:rbd_mobile/screens/settings_screen/settings_screen.dart';
import 'package:rbd_mobile/screens/kelas_screen/kelas_screen.dart';
import 'package:flutter/cupertino.dart'; // Corrected the typo

Map<String, WidgetBuilder> routes = {
  // All screens will be registered here like manifest in Android
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  TutorScreen.routeName: (context) => const TutorScreen(),
  StoreScreen.routeName: (context) => const StoreScreen(),
  KonselingScreen.routeName: (context) => const KonselingScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
  KelasScreen.routeName: (context) => const KelasScreen(),
};
