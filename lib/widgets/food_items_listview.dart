import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:say_no_waste/providers/all_food_items.dart';

class FoodItemsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AllFoodItems foodItemsList = Provider.of<AllFoodItems>(context);

    return ListView.separated(
      itemBuilder: (ctx, i) {
        DateTime expirationDate = foodItemsList.getMyFoodItems()[i].expirationDate;
        DateTime today = DateTime.now();
        int daysRemaining = expirationDate.difference(today).inDays;

        return Dismissible(
          key: Key(foodItemsList.getMyFoodItems()[i].toString()),
          direction: DismissDirection.endToStart,
          confirmDismiss: (_) => showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("Delete Item"),
              content: Text("Are you sure you want to delete this item?"),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.of(ctx).pop(false),
                ),
                TextButton(
                  child: Text("Delete"),
                  onPressed: () => Navigator.of(ctx).pop(true),
                ),
              ],
            ),
          ),
          onDismissed: (_) {
            // Handle delete action here
            // You can call a method from your provider to delete the item
            foodItemsList.removeFoodItem(i);
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Show alert box when tapped
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Delete Item"),
                          content: Text("Are you sure you want to delete this item?"),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () => Navigator.of(ctx).pop(),
                            ),
                            TextButton(
                              child: Text("Delete"),
                              onPressed: () {
                                // Delete the item
                                foodItemsList.removeFoodItem(i);
                                Navigator.of(ctx).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: SizedBox(width: 0),
                  ),
                ],
              ),
            ),
          ),
          child: ListTile(
            leading: Image.asset('images/${foodItemsList.getMyFoodItems()[i].category}-icon.png'),
            title: Text(
              foodItemsList.getMyFoodItems()[i].name,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "Expire in $daysRemaining days",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      itemCount: foodItemsList.getMyFoodItems().length,
      separatorBuilder: (ctx, i) {
        return Divider(height: 3, color: Colors.blueGrey);
      },
    );
  }
}
