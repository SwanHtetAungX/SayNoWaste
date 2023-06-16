import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MyButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF725C),
        minimumSize: const Size(321, 65),
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          fontSize: 20,
        ),
      ),
    );
  }
}
