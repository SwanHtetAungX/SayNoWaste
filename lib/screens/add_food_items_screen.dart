import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:say_no_waste/providers/all_food_items.dart';
import 'package:say_no_waste/screens/food_items_list_screen.dart';

class AddFoodItemsScreen extends StatefulWidget {
  static String routeName = "/add-food-items";

  @override
  _AddFoodItemsScreenState createState() => _AddFoodItemsScreenState();
}

class _AddFoodItemsScreenState extends State<AddFoodItemsScreen> {
  var form = GlobalKey<FormState>();
  String? name;
  String? storage;
  int? quantity;
  String? category;
  String? selectedButton;
  DateTime? expirationDate;
  void presentDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)))
        .then((value) {
      if (value == null) return;
      setState(() {
        expirationDate = value;
      });
    });
  }

  void saveForm(foodItemsList) {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      debugPrint(name);
      debugPrint(selectedButton);
      debugPrint(quantity!.toString());
      debugPrint(category);
      foodItemsList.addFoodItem(
          name, selectedButton,expirationDate, quantity, category, );
      // Hide the keyboard
      FocusScope.of(context).unfocus();
      // Resets the form
      form.currentState!.reset();

      expirationDate = null;
      // Shows a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Food Item added successfully')));
    }
  }

  void _selectButton(String buttonName) {
    setState(() {
      selectedButton = buttonName;
      print('Selected Button: $selectedButton');
    });
  }

  @override
  Widget build(BuildContext context) {
    AllFoodItems foodItemsList = Provider.of<AllFoodItems>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1A202C),
      appBar: AppBar(
        title: const Text(
          'SayNoWaste',
          style: TextStyle(
              letterSpacing: 5,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color((0xFFFF725C))),
        ),
        backgroundColor: const Color(0xFF2C323D),
      ),
      body: Container(
        child: Form(
          key: form,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.length == 0)
                      return 'Please Provide Name of the Food Item';
                    else
                      return null;
                  },
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF2C323D),
                      hintText: 'Item Name',
                      hintStyle: TextStyle(
                          color: Colors.white, fontFamily: 'Poppins')),
                  onSaved: (value) {
                    name = value as String;
                  },
                ),
              ),
              Text(
                'Add to',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _selectButton('My Freezer');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedButton == 'My Freezer'
                          ? Color(0xFFFF725C) // Selected button color
                          : Color(0xFF2C323D), // Unselected button color
                    ),
                    child: Text('My Freezer'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _selectButton('My Fridge');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedButton == 'My Fridge'
                          ? Color(0xFFFF725C) // Selected button color
                          : Color(0xFF2C323D), // Unselected button color
                    ),
                    child: Text('My Fridge'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _selectButton('My Pantry');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedButton == 'My Pantry'
                          ? Color(0xFFFF725C) // Selected button color
                          : Color(0xFF2C323D),
                      // Unselected button color
                    ),
                    child: Text('My Pantry'),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Select an Expiration Date',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  presentDatePicker(context);
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 26, horizontal: 30),
                    backgroundColor: Color(0xFF2C323D),
                    foregroundColor: Colors.grey),
                child: Text(
                  expirationDate == null
                      ? "dd/MM/yyyy"
                      : DateFormat('dd/MM/yyyy').format(expirationDate!),
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Details',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 30),
                    child: Text(
                      'Quantity',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 16, // Adjust the font size as desired
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 50, right: 30, top: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.length == 0)
                            return 'Please provide the quantity';
                          else
                            return null;
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16, // Adjust the font size as desired
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF2C323D),
                          hintText: '0',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 13, // Adjust the font size as desired
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onSaved: (value) {
                          quantity = int.parse(value!);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      'Category',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 16, // Adjust the font size as desired
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value == null)
                            return "Please provide a category";
                          else
                            return null;
                        },
                        dropdownColor: Color(0xFF1A202C),
                        items: [
                          DropdownMenuItem(
                            value: 'dairy',
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset('images/dairy-icon.png',
                                      height: 50),
                                  SizedBox(width: 10),
                                  Text(
                                    'Dairy',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'meat',
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset('images/meat-icon.png',
                                      height: 50),
                                  SizedBox(width: 10),
                                  Text('Meat',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'vegetable',
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset('images/vegetable-icon.png',
                                      height: 50),
                                  SizedBox(width: 10),
                                  Text('Vegetable',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'fruit',
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset('images/fruit-icon.png',
                                      height: 30),
                                  SizedBox(width: 10),
                                  Text('Fruit',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'snack',
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'images/snack-icon.png',
                                    height: 50,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Snack',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          category = value as String;
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 130,
          height: 40,
          child: FloatingActionButton.extended(
            onPressed: () {
              saveForm(foodItemsList);
              Navigator.of(context).pushReplacementNamed(FoodItemsListScreen.routeName);
            },
            label: Text('Add'),
            icon: Icon(Icons.add),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: Color(0xFFFF725C),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF2C323D),
          selectedItemColor: Color(0xFFFF725C),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              TextStyle(color: Color(0xFFFF725C), fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('images/storage_icon.png'), label: "Storage"),
            BottomNavigationBarItem(
                icon: Image.asset('images/share_bef.png'), label: "Food Share"),
            BottomNavigationBarItem(
                icon: Image.asset('images/cart_bef.png'),
                label: "Shopping Cart"),
            BottomNavigationBarItem(
                icon: Image.asset('images/user_bef.png'), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
