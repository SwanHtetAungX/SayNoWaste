import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A202C),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Say No Waste', style:TextStyle(color:Color(0xFFFF725C),fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 30)),
            const Text('A food Waste Reducing App', style: TextStyle(color: Color(0xFFFF725C),fontFamily: 'Poppins'),),
            const SizedBox(height: 50),
            Image.asset('images/splash.png'),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF725C),
                fixedSize: const Size(321, 65),
                shape: const StadiumBorder()),
              onPressed: () {
                // Sign Up button logic
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold ,fontFamily: 'Poppins',fontSize: 20),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A202C),
              side: const BorderSide(width: 1, color: Color(0xFFFF725C)),
              fixedSize: const Size(321, 65),
              shape: const StadiumBorder()),
              onPressed: () {
                // Sign In button logic
              },
              child: const Text(
                'Sign In',
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFFFF725C),fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
