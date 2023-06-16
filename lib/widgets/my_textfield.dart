import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Color hintTextColor;
  final double hintOpacity;

  const MyTextField({
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.hintText = '',
    this.hintTextColor = Colors.grey,
    this.hintOpacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final Color hintColorWithOpacity =
        hintTextColor.withOpacity(hintOpacity);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFFFF725C),
                fontSize: 15.0,
                fontFamily: 'Poppins'
              ),
            ),
          ),
          TextField(
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: const Color(0xFFFF725C).withOpacity(0.31),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFFF725C)),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintColorWithOpacity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
