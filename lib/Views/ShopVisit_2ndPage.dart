import 'package:flutter/material.dart';
import 'package:order_booking_shop/Views/NewOrderBookingPage.dart';
import 'package:order_booking_shop/Views/OrderBookingPage.dart';


void main() {
  runApp(MaterialApp(
    home: ShopVisit_2ndPage(),
  ));
}

class ShopVisit_2ndPage extends StatefulWidget {
  @override
  _ShopVisit_2ndPageState createState() => _ShopVisit_2ndPageState();
}

class _ShopVisit_2ndPageState extends State<ShopVisit_2ndPage> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  String feedbackText = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Title'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRow('2-Performed Store Walkthrough', checkboxValue1, (bool? value) {
                  if (value != null) {
                    setState(() {
                      checkboxValue1 = value;
                    });
                  }
                }),
                buildRow('3-Update Store Planogram', checkboxValue2, (bool? value) {
                  if (value != null) {
                    setState(() {
                      checkboxValue2 = value;
                    });
                  }
                }),
                buildRow('4-Shelf tags and price signage check', checkboxValue3, (bool? value) {
                  if (value != null) {
                    setState(() {
                      checkboxValue3 = value;
                    });
                  }
                }),
                buildRow('5-Expiry date on product reviewed', checkboxValue4, (bool? value) {
                  if (value != null) {
                    setState(() {
                      checkboxValue4 = value;
                    });
                  }
                }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle button click
                  },
                  child: Text('+ Add Photo'),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewOrderBookingPage()
                      ),
                    );// Navigate to the NinthPage
                  },
                  child: Text('+ Order Booking Form'),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                Text('Feedback/ Special Note'),
                SizedBox(height: 20.0),
                // Feedback or Note Box
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Feedback or Note',
                      border: InputBorder.none,
                    ),
                    maxLines: 3,
                    onChanged: (text) {
                      setState(() {
                        feedbackText = text;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the ThirdPage
                  },
                  child: Text('Submit'),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String text, bool value, void Function(bool?) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.black), // Set the font size here
        ),
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: Colors.green,
        ),
      ],
    );
  }
}
// TODO Implement this library.