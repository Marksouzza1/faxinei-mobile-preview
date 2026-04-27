import 'package:flutter/material.dart';

class FaxineiTextField extends StatelessWidget {
  const FaxineiTextField({
    required this.controller,
    required this.label,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.maxLines = 1,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      maxLines: maxLines,
      style: const TextStyle(
        color: Color(0xFF2E2723),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
