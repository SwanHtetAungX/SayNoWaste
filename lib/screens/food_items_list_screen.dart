import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:say_no_waste/providers/all_food_items.dart';
import 'package:say_no_waste/screens/add_food_items_screen.dart';
import 'package:say_no_waste/widgets/food_items_listview.dart';
import 'package:say_no_waste/widgets/my_floating_action_button.dart';

class FoodItemsListScreen extends StatelessWidget {
  static String routeName = "/fooditems-list";

  @override
  Widget build(BuildContext context) {
    AllFoodItems foodItemsList = Provider.of<AllFoodItems>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1A202C),
      appBar: AppBar(
        title: const Text(
          'SayNoWaste',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Color((0xFFFF725C)),
          ),
        ),
        backgroundColor: const Color(0xFF2C323D),
      ),
      body: Container(
        alignment: Alignment.center,
        child: foodItemsList.getMyFoodItems().length > 0
            ? FoodItemsListView()
            : Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    'images/box.png',
                    width: 300,
                  ),
                  Text(
                    'You will see your food list here.. \n but the list is empty. \n Tap the add button to add food.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
      ),

      floatingActionButton: MyFloatingActionButton(),
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF2C323D),
          selectedItemColor: Color(0xFFFF725C),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            color: Color(0xFFFF725C),
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/storage_icon.png'),
              label: "Storage",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/share_bef.png'),
              label: "Food Share",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/cart_bef.png'),
              label: "Shopping Cart",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/user_bef.png'),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
