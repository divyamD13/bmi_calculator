import 'package:bmi_calculator/pages/homepage.dart';
import 'package:bmi_calculator/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme:ColorScheme.fromSeed(seedColor: Colors.green.shade400),
        useMaterial3:true,
      ),
      home: SplashScreen(),
    );
  }
}

