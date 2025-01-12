import 'dart:async';


import 'package:flutter/material.dart';

import '../onBoarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
void initState() {
  super.initState();
  Timer(const Duration(seconds: 2), () {
    debugPrint("Navigating to OnboardingScreen...");
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()));
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 125,
              width: 333,
            ),
        
            const SizedBox(height: 20,),
        
            // const Text("Chat Application \n for Everyone",
            // style: TextStyle(
            //   fontFamily: 'poppins',
            //   fontWeight: FontWeight.bold,
            //   fontSize: 20,
            // ),)
        
          ],
        ),
      ),
    );
    
  }
}
