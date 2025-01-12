import 'package:flutter/material.dart';

class VerifyCodeTextField extends StatelessWidget {
  final int maxLength;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function() onFieldComplete;

  const VerifyCodeTextField({
    super.key,
    required this.maxLength,
    required this.controller,
    required this.focusNode,
    required this.onFieldComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      maxLength: maxLength,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        if (value.length == maxLength) {
          onFieldComplete(); // Trigger completion when code is entered
        }
      },
      decoration: InputDecoration(
        hintText: "Enter verification code",
        counterText: "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFE0E0E0),
          ),
        ),
      ),
    );
  }
}