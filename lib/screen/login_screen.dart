import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/my_textfields.dart';
import 'main_screen.dart';
import 'verify_screen.dart';

class LoginPage extends StatefulWidget {
  final String verificationid;
  const LoginPage({super.key, required this.verificationid});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _phoneFocusNode = FocusNode();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? _verificationId; // Add a state variable for verificationId

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _countryCodeController.dispose(); // Dispose controllers
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Image.asset(
            "assets/images/Vector.png",
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "Enter Your Phone Number",
              style: TextStyle(
                fontFamily: 'mulish',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please confirm your country code and enter \n your phone number",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  height: 36,
                  width: 74,
                  child: MyTextfield(
                    hintText: '+977',
                    keyboardType: TextInputType.phone,
                    isCountryCode: true,
                    controller: _countryCodeController, // Pass controller
                    onFieldComplete: () {
                      FocusScope.of(context).requestFocus(_phoneFocusNode);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 36,
                  width: 245,
                  child: MyTextfield(
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    focusNode: _phoneFocusNode,
                    maxLength: 10,
                    controller: _phoneNumberController, // Pass controller
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final phoneNumber =
                        _phoneNumberController.text.trim(); // Trim spaces
                    final countryCode = _countryCodeController.text.trim();

                    if (phoneNumber.isNotEmpty && countryCode.isNotEmpty) {
                      try {

                        // await FirebaseAuth.instance.verifyPhoneNumber(
                        //   phoneNumber:
                        //       '$countryCode$phoneNumber', // Concatenate country code and number
                        //   verificationCompleted:
                        //       (PhoneAuthCredential credential) {
                        //     // Auto-retrieval or instant verification
                        //     FirebaseAuth.instance
                        //         .signInWithCredential(credential)
                        //         .then((value) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()),
                              );
                          //   });
                          // },
                          // verificationFailed: (FirebaseAuthException ex) {
                          //   // Handle errors
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //         content: Text(
                          //             "Verification failed: ${ex.message}")),
                          //   );
                          // },
                          // codeSent: (String verificationId, int? resendToken) {
                          //   setState(() {
                          //     _verificationId = verificationId;
                          //   });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyPage(
                                  // verificationid: verificationId,
                                  phoneNumber: phoneNumber,
                                  countryCode: countryCode,
                                ),
                              ),
                            );
                        //   },
                        //   codeAutoRetrievalTimeout: (String verificationId) {
                        //     // Timeout handler
                        //   },
                        // );

                
                      } catch (ex) {
                        // Handle exceptions (e.g., network errors)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text("An error occurred: ${ex.toString()}")),
                        );
                      }
                    } else {
                      // Show an error message if fields are empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Please enter both country code and phone number."),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF002DE3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'mulish',
                    ),
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
