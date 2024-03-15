import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.keyboardType = TextInputType.text,

});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}