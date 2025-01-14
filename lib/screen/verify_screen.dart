  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';
  import '../CustomWidgets/my_verify_code.dart';
  import 'main_screen.dart';

  class VerifyPage extends StatefulWidget {
    // String verificationid;
    final String phoneNumber;
    final String countryCode;

    VerifyPage({
      super.key,
      // required this.verificationid,
      required this.phoneNumber,
      required this.countryCode,
    });

    @override
    State<VerifyPage> createState() => _VerifyPageState();
  }

  class _VerifyPageState extends State<VerifyPage> {
    final TextEditingController _codeController = TextEditingController();
    final FocusNode _codeFocusNode = FocusNode();

    @override
    void dispose() {
      _codeController.dispose();
      _codeFocusNode.dispose();
      super.dispose();
    }

    void _onFieldComplete() {
      // Handle the completion of code input, e.g., move to the next field or verify the code
      debugPrint("Verification code entered: ${_codeController.text}");
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Enter Code",
                  style: TextStyle(
                    fontFamily: 'mulish',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "We've sent you an SMS with the code \n to ${widget.countryCode} ${widget.phoneNumber}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 30),
                VerifyCodeTextField(
                  maxLength: 6, // 6 digit code
                  controller: _codeController,
                  focusNode: _codeFocusNode,
                  onFieldComplete: _onFieldComplete,
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          // PhoneAuthCredential credential =
                          //     PhoneAuthProvider.credential(
                          //   verificationId: widget.verificationid,
                          //   smsCode: _codeController.text.trim(),
                          // );

                          // // Attempt to sign in with the provided credential
                          // UserCredential userCredential = await FirebaseAuth
                          //     .instance
                          //     .signInWithCredential(credential);

                          // // Check if sign-in was successful
                          // if (userCredential.user != null) {
                            // Navigate to the main screen if the user is signed in
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()),
                            );
                          // } else {
                          //   // Show a message if the user could not be authenticated
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //       content:
                          //           Text("Sign-in failed. Please try again."),
                          //     ),
                          //   );
                          // }
                        } catch (e) {
                          // Handle any exceptions (e.g., incorrect verification code)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Error: ${e.toString()}"),
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

                    //
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // try {
                    //     //   PhoneAuthCredential credential =
                    //     //       PhoneAuthProvider.credential(
                    //     //     verificationId: widget.verificationid,
                    //     //     smsCode: _codeController.text.trim(),
                    //     //   );

                    //     //   FirebaseAuth.instance
                    //     //       .signInWithCredential(credential)
                    //     //       .then((value) {
                    //     //     Navigator.pushReplacement(
                    //     //       context,
                    //     //       MaterialPageRoute(
                    //     //           builder: (context) => const MainScreen()),
                    //     //     );
                    //     //   }).catchError((error) {
                    //     //     ScaffoldMessenger.of(context).showSnackBar(
                    //     //       const SnackBar(
                    //     //         content: Text(
                    //     //             "Please enter a correct Verification Code."),
                    //     //       ),
                    //     //     );
                    //     //   });
                    //     // } catch (ex) {
                    //     //   ScaffoldMessenger.of(context).showSnackBar(
                    //     //     const SnackBar(
                    //     //       content:
                    //     //           Text("An error occurred. Please try again."),
                    //     //     ),
                    //     //   );
                    //     // }
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: const Color(0XFF002DE3),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //   ),
                    //   child: const Text(
                    //     "Verify",
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       color: Colors.white,
                    //       fontFamily: 'mulish',
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
