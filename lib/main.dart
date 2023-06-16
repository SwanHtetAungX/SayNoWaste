import 'package:flutter/material.dart';
import 'package:say_no_waste/screens/login_screen.dart';
import 'package:say_no_waste/screens/sign_up_screen.dart';
import 'package:say_no_waste/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>SplashScreen(),
        SignUpScreen.routeName:(_){return SignUpScreen();},
        LoginScreen.routeName:(_){return LoginScreen();}//Set Splash Screen as the initial route
      },
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SayNoWaste',
        ),
      ),
      body: const Center(
        child: Text(
          'This is a sample Text widget',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 30,
              letterSpacing: 4,
              color: Colors.orange),
        ),
      ),
    );
  }
}
