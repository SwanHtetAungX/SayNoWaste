import 'package:flutter/material.dart';
import 'package:say_no_waste/screens/add_food_items_screen.dart';


class MyFloatingActionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter, // Adjust the alignment to set the desired vertical position
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 90,
            height: 35,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AddFoodItemsScreen.routeName);
                // Functionality 1
              },
              label: Text('Add'),
              icon: Icon(Icons.add),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              backgroundColor: Color(0xFFFF725C),
            ),
          ),
          SizedBox(width: 1),
          SizedBox(
            width: 90,
            height: 35,
            child: FloatingActionButton.extended(
              onPressed: () {
                // Functionality 2
              },
              label: Text('Sort'),
              icon: Icon(Icons.sort),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              backgroundColor: Color(0xFFFF725C),
            ),
          ),
        ],
      ),
    );
  }
}
