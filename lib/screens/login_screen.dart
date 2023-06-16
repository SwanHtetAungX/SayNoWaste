import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:say_no_waste/screens/sign_up_screen.dart';
import 'package:say_no_waste/widgets/my_button.dart';
import 'package:say_no_waste/widgets/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/sign-up-bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 60.0),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 35,
                    color: Color(0xFFFF725C),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
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
              const Padding(
                padding: EdgeInsets.only(left: 200.0),
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                      color: Color(0xFFFF725C),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: MyButton(
                  label: 'Login',
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account?,",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.grey[500],
                    ),
                    children: [
                      TextSpan(
                        text: " Sign Up",
                        style: const TextStyle(
                          color: Color(0xFFFF725C),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushReplacementNamed(SignUpScreen.routeName);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Connect with',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                                                    fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 170),
                child: Image.asset('images/google.png'),
              ),
            ],
          ),
        ),
    
    );
  }
}

