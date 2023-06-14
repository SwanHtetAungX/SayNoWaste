import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:const   Color(0xFF1A202C),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: const Column(
          children: [
          SizedBox(height: 45,),
          Text('Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 35,
            color: Color(0xFFFF725C)
          ),),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Color(0xFFFF725C))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                )
            ),
            
          )
        ],),
      ),

    );
}
}