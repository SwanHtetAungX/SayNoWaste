import 'package:flutter/material.dart';
import 'package:say_no_waste/models/food_items.dart';

class AllFoodItems with ChangeNotifier {
  List <FoodItem> myFoodItems =[];
  List <FoodItem> getMyFoodItems(){
    return myFoodItems;
  }
  void addFoodItem(name,storage,expirationDate,quantity,category){
    myFoodItems.insert(0, FoodItem(name: name, storage: storage, expirationDate: expirationDate, quantity: quantity, category: category));
    notifyListeners();
  }
  void removeFoodItem(i){
    myFoodItems.removeAt(i);
    notifyListeners();
  }
  
}