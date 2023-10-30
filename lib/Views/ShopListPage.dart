import 'package:flutter/material.dart';
import 'package:order_booking_shop/Views/HomePage.dart';


void main() {
  runApp(MaterialApp(
    home: ShopListPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ShopListPage extends StatefulWidget {
  @override
  _ShopListPageState createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> {
  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  String selectedItem = '';
  String feedbackText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        toolbarHeight: 56.0,
        backgroundColor: Colors.grey,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert), // Dropdown menu icon
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: Text('Settings'),
                  value: 'Option 1',
                ),
                PopupMenuItem(
                  child: Text('Log out'),
                  value: 'Option 2',
                ),
              ];
            },
            onSelected: (value) {
              // Handle the selection from the dropdown menu here
              print('Selected: $value');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Shop List',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey[200],
                ),
                child: DropdownButton<String>(
                  value: selectedItem.isEmpty ? null : selectedItem,
                  hint: Text('---Select Shop---'),
                  onChanged: (newValue) {
                    setState(() {
                      selectedItem = newValue!;
                    });
                  },
                  items: dropdownItems.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  isExpanded: true,
                  underline: Container(),
                  style: TextStyle(color: Colors.black),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text('Selected Item: ${selectedItem.isEmpty ? 'None' : selectedItem}'),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Feedback or Note',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  onChanged: (text) {
                    setState(() {
                      feedbackText = text;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your "Attachment" button click action here
                    },
                    icon: Icon(Icons.add),
                    label: Text('Image'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(200, 50),
                    ),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  onPrimary: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: Size(200, 50),
                ),
                child: Text(
                  'Clock In',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
