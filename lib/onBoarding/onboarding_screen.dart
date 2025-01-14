import 'package:flutter/material.dart';
import '../screen/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset(
              "assets/images/Illustration.png",
              height: 271,
              width: 262,
            ),
            const SizedBox(height: 20),
            const Text(
              "Connect easily with \n your family and friends \n over countries",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'mulish',
              ),
            ),
            const SizedBox(height: 250),
            const Text(
              "Terms & Privacy Policy",
              style: TextStyle(
                fontFamily: 'mulish',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 52,
              width: 327,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(verificationid: '',),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF002DE3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Agree and Continue",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'mulish',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
