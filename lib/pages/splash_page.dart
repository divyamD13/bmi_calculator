import 'dart:async';

import 'package:bmi_calculator/pages/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds:3 ), 
      ()
       {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context)=>HomePage()));
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      body:Center(
        child:Container(
          width: 100,
          height:100,
          child: Image.asset('assets/images/bmi_splash.png'),
        ) ,)

    );
  }
}