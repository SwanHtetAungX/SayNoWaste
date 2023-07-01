import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:say_no_waste/providers/all_food_items.dart';
import 'package:say_no_waste/screens/add_food_items_screen.dart';
import 'package:say_no_waste/screens/food_items_list_screen.dart';
import 'package:say_no_waste/screens/login_screen.dart';
import 'package:say_no_waste/screens/sign_up_screen.dart';
import 'package:say_no_waste/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AllFoodItems>(create: (ctx)=> AllFoodItems())
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/':(context)=>SplashScreen(),//Set Splash Screen as the initial route
          SignUpScreen.routeName:(_){return SignUpScreen();},
          LoginScreen.routeName:(_){return LoginScreen();},
          AddFoodItemsScreen.routeName:(_){return AddFoodItemsScreen();},
          FoodItemsListScreen.routeName:(_){return FoodItemsListScreen();}
        },
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        
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
