import 'package:flutter/material.dart';
import 'package:order_booking_shop/Views/ShopVisit_2ndPage.dart';




class ShopVisit extends StatefulWidget {
  @override
  _ShopVisitState createState() => _ShopVisitState();
}

class _ShopVisitState extends State<ShopVisit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _textField1Controller = TextEditingController();
  TextEditingController _textField2Controller = TextEditingController();
  TextEditingController _textField3Controller = TextEditingController();

  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  String? selectedDropdownValue;

  @override
  void initState() {
    super.initState();
    selectedDropdownValue = dropdownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Visit'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'DATE',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 150, // Adjust the width
                            child: TextFormField(

                              decoration: InputDecoration(
                                labelText: 'Field 1',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              textAlign: TextAlign.right,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Shop Name',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    TextFormField(

                      decoration: InputDecoration(
                        labelText: 'Shop Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Visit Conducted By',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      controller: _textField3Controller,
                      decoration: InputDecoration(
                        labelText: 'Visit Conducted By',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Visit Conducted By',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(),
                            ),
                            child: DropdownButton<String>(
                              value: selectedDropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedDropdownValue = newValue;
                                });
                              },
                              items: dropdownItems.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Checklist',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '1-Stock Check(Current Balance)',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Item Description',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            SizedBox(width: 20), // Adjust the spacing
                            Text(
                              '          Qty',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              width: 150, // Adjust the width
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: DropdownButton<String>(
                                value: selectedDropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedDropdownValue = newValue;
                                  });
                                },
                                items: dropdownItems.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(width: 20), // Adjust the spacing
                            Container(
                              width: 50, // Adjust the width
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              width: 150, // Adjust the width
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: DropdownButton<String>(
                                value: selectedDropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedDropdownValue = newValue;
                                  });
                                },
                                items: dropdownItems.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(width: 20), // Adjust the spacing
                            Container(
                              width: 50, // Adjust the width
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),  SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              width: 150, // Adjust the width
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: DropdownButton<String>(
                                value: selectedDropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedDropdownValue = newValue;
                                  });
                                },
                                items: dropdownItems.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(width: 20), // Adjust the spacing
                            Container(
                              width: 50, // Adjust the width
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),  SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              width: 150, // Adjust the width
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: DropdownButton<String>(
                                value: selectedDropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedDropdownValue = newValue;
                                  });
                                },
                                items: dropdownItems.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(width: 20), // Adjust the spacing
                            Container(
                              width: 50, // Adjust the width
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the NinthPage
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShopVisit_2ndPage()));

                  if (_formKey.currentState!.validate()) {
                    final text1 = _textField1Controller.text;
                    final text2 = _textField2Controller.text;
                    final text3 = _textField3Controller.text;
                    final dropdownValue = selectedDropdownValue;
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  '+ Add More',
                  style: TextStyle(
                    fontSize: 18,
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
