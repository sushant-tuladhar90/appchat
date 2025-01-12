import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextfield extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isCountryCode;
  final FocusNode? focusNode;
  final void Function()? onFieldComplete;
  final int? maxLength;
  final TextEditingController? controller;  // Add this line

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.isCountryCode = false,
    this.focusNode,
    this.onFieldComplete,
    this.maxLength,
    this.controller,  // Add this line
  });

  @override
  _MyTextfieldState createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.isCountryCode ? TextInputAction.next : TextInputAction.done,
      controller: widget.controller,  // Use controller here
      onChanged: (value) {
        if (widget.isCountryCode) {
          if (!value.startsWith('+') && value.isNotEmpty) {
            widget.controller?.text = '+${value.replaceAll('+', '')}';
            widget.controller?.selection = TextSelection.fromPosition(
              TextPosition(offset: widget.controller!.text.length),
            );
          }

          if (widget.controller!.text.length > 4) {
            widget.controller!.text = widget.controller!.text.substring(0, 4);
            widget.controller?.selection = TextSelection.fromPosition(
              TextPosition(offset: widget.controller!.text.length),
            );
          }

          if (widget.controller!.text.length == 4 && widget.onFieldComplete != null) {
            widget.onFieldComplete!();
          }
        }
      },
      maxLength: widget.maxLength,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        fillColor: const Color(0XFFF7F7FC),
        filled: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0XFFADB5BD),
        ),
        counterText: '', // Hide counter text
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
