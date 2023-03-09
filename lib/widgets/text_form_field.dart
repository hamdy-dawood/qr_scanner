import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
  });

  final String label;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 20,
          top: 20,
          bottom: 20,
        ),
        labelText: label,
        counterStyle: const TextStyle(
          color: Colors.white,
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: const Color(0xff005Bc1),
        labelStyle: const TextStyle(
          color: Colors.white70,
        ),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xff005Bc1),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xff005Bc1),
          ),
        ),
      ),
    );
  }
}
