import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:say_no_waste/screens/login_screen.dart';
import 'package:say_no_waste/widgets/my_button.dart';
import 'package:say_no_waste/widgets/my_textfield.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A202C),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 35,
                color: Color(0xFFFF725C),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            MyTextField(
              label: 'Username',
              controller: TextEditingController(),
              hintText: 'Enter your username',
              hintTextColor: Colors.white,
              hintOpacity: 0.46,
            ),
            const SizedBox(height: 15),
            MyTextField(
              label: 'Email',
              controller: TextEditingController(),
              hintText: 'Enter your email',
              hintTextColor: Colors.white,
              hintOpacity: 0.46,
            ),
            const SizedBox(height: 15),
            MyTextField(
              label: 'Password',
              controller: TextEditingController(),
              hintText: 'Enter your password',
              obscureText: true,
              hintTextColor: Colors.white,
              hintOpacity: 0.46,
            ),
            const SizedBox(height: 15),
            MyTextField(
              label: 'Re-Password',
              controller: TextEditingController(),
              hintText: 'Re-enter your password',
              obscureText: true,
              hintTextColor: Colors.white,
              hintOpacity: 0.46,
            ),
            const SizedBox(height: 40,),
           MyButton(label: 'Sign Up', onPressed:(){
              Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
            }),
           const SizedBox(height:20,),
               RichText(
                text: TextSpan(
                  text: "I already have an account,",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                  children:  [
                    TextSpan(
                      text: " Login",
                      style: const TextStyle(
                        color: Color(0xFFFF725C),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      recognizer: TapGestureRecognizer()..onTap =(){
                        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                      }
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.5,
                      color: Colors.grey[400],
                      ),
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: Text('Or Connect with', style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),),
                      ),
                      Expanded(child: Divider(thickness: 0.5,
                      color: Colors.grey[400],))
              
                  ],),
              ),
              const SizedBox(height: 25,),
              Image.asset('images/google.png')
            
        ],
        ),
      ),
    );
  }
}
