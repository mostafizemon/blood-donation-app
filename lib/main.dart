import 'package:blood_donation/feature/screens/home_screen/home_screen.dart';
import 'package:blood_donation/feature/screens/welcome_screen/welcome_screen.dart';
import 'package:blood_donation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/screens/find_donors_screen/find_donors_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation',
      theme: AppThemeData.lightThemeData,
      initialRoute: "/",

      routes: {
        "/": (context) => WelcomeScreen(),
        "home_screen":(context)=>HomeScreen(),
        "find_donors_screen":(context)=>FindDonorsScreen(),
      },
    );
  }
}
