// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// //import 'package:http/http.dart' as http;
// import '../Databases/OrderDatabase.dart';
// import '../Models/OrderDetails.dart';
// import '../Models/OrderMaster.dart';
// import '../Models/ProductsModel.dart';
// import 'OrderConfirmationPage.dart';
// //import 'OrderDetails.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: OrderBookingPage(),
//     ),
//   ));
// }
//
// class OrderBookingPage extends StatefulWidget {
//   OrderBookingPage();
//
//   @override
//   _OrderBookingPageState createState() => _OrderBookingPageState();
// }
//
// class _OrderBookingPageState extends State<OrderBookingPage> {
//   TextEditingController _textField1Controller = TextEditingController();
//   TextEditingController _textField2Controller = TextEditingController();
//   TextEditingController _textField3Controller = TextEditingController();
//   TextEditingController _textField4Controller = TextEditingController();
//
//   List<Product> data = [];
//   List<OrderMaster> orderDatabase = [];
//   List<OrderMaster> savedOrders = [];
//
//   List<String> selectedDropdownValues = [];
//   Map<String, int> itemQuantities = {};
//   List<String> dropdownItems = [];
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     fetchProducts(); // Call the function to fetch products
//   }
//
//   Future<void> fetchProducts() async {
//     final products = await DatabaseHelper.instance.fetchProducts();
//     for (var product in products) {
//       dropdownItems.add(
//           '${product.product_code} ${product.product_name} ${product
//               .uom} ${product.price}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Booking'),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             buildTextField('Shop Name', _textField1Controller),
//             buildTextField('Owner Name', _textField2Controller),
//             buildTextField('Phone No', _textField3Controller),
//             buildTextField('Brand', _textField4Controller),
//             buildCustomDropdown(selectedDropdownValues, dropdownItems),
//             SizedBox(height: 10),
//             Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: _onSubmitButtonPressed,
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                       Colors.blue),
//                 ),
//                 child: Text('Submit'),
//               ),
//             ),
//             // Display saved orders
//             if (savedOrders.isNotEmpty) ..._buildSavedOrders(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // void _onSubmitButtonPressed() async {
//   //   String shopName = _textField1Controller.text;
//   //   String ownerName = _textField2Controller.text;
//   //   String phoneNo = _textField3Controller.text;
//   //   String brand = _textField4Controller.text;
//   //
//   //   OrderMaster order = OrderMaster(
//   //     shopName: shopName,
//   //     ownerName: ownerName,
//   //     phoneNo: phoneNo,
//   //     brand: brand,
//   //     orderId: '', orderDetails: [],
//   //   );
//   //
//   //   final db = await DatabaseHelper.instance.database;
//   //   int orderId = await db.insert('OrderMaster', order as Map<String, Object?>);
//   //
//   //   List<OrderDetails> orderDetails = [];
//   //   for (String selectedItem in selectedDropdownValues) {
//   //     final itemData = selectedItem.split(' ');
//   //     final productId = itemData[0];
//   //     final quantity = itemQuantities[selectedItem] ?? 0;
//   //
//   //     // Fetch product details or set them as needed
//   //     String itemPrice = '0.0';
//   //
//   //     OrderDetails detail = OrderDetails(
//   //       orderId: orderId.toString(),
//   //       productCode: productId,
//   //       productName: itemData[1],
//   //       uom: itemData[2],
//   //       price: itemPrice,
//   //       quantity: quantity,
//   //     );
//   //
//   //     orderDetails.add(detail);
//   //
//   //     await db.insert('OrderDetails', detail.toMap());
//   //   }
//   //
//   //   Fluttertoast.showToast(
//   //     msg: 'Data saved successfully!',
//   //     toastLength: Toast.LENGTH_SHORT,
//   //     gravity: ToastGravity.BOTTOM,
//   //     backgroundColor: Colors.green,
//   //     textColor: Colors.white,
//   //   );
//   //
//   //   // Update the UI with the saved order
//   //   final savedOrder = order.copyWith(orderId: orderId.toString(), orderDetails: orderDetails);
//   //   setState(() {
//   //     savedOrders.add(savedOrder);
//   //   });
//   // }
//   //
//   // // Helper function to build saved orders UI
//   // List<Widget> _buildSavedOrders() {
//   //   return savedOrders.map((order) {
//   //     return Card(
//   //       child: Column(
//   //         children: [
//   //           Text('Shop Name: ${order.shopName}'),
//   //           Text('Owner Name: ${order.ownerName}'),
//   //           Text('Phone No: ${order.phoneNo}'),
//   //           Text('Brand: ${order.brand}'),
//   //           Text('Order ID: ${order.orderId}'),
//   //           Text('Order Details:'),
//   //           Column(
//   //             children: order.orderDetails.map((detail) {
//   //               return ListTile(
//   //                 title: Text('Product: ${detail.productName}'),
//   //                 subtitle: Text('Quantity: ${detail.quantity}'),
//   //               );
//   //             }).toList(),
//   //           ),
//   //         ],
//   //       ),
//   //     );
//   //   }).toList();
//   // }
//   void _onSubmitButtonPressed() async {
//     // Get the data from user inputs
//     String shopName = _textField1Controller.text;
//     String ownerName = _textField2Controller.text;
//     String phoneNo = _textField3Controller.text;
//     String brand = _textField4Controller.text;
//
//     // Create an OrderMaster instance
//     OrderMaster order = OrderMaster(
//       shopName: shopName,
//       ownerName: ownerName,
//       phoneNo: phoneNo,
//       brand: brand,
//       orderDetails: [],
//       orderId: '', // You may add the generated orderId here if needed
//     );
//
//     // Create and insert OrderDetails for each selected item
//     List<OrderDetails> orderDetails = [];
//     for (String selectedItem in selectedDropdownValues) {
//       final itemData = selectedItem.split(' ');
//       final productCode = itemData[0];
//
//       final quantity = itemQuantities[selectedItem] ?? 0;
//
//       Product product = data.firstWhere(
//             (product) => product.product_code == productCode,
//         orElse: () =>
//             Product(
//               product_code: '',
//               product_name: '',
//               uom: '',
//               price: '0.0',
//             ),
//       );
//
//       String itemPrice = product.price;
//
//       OrderDetails detail = OrderDetails(
//         orderId: order.orderId,
//         productCode: productCode,
//         productName: itemData[1],
//         uom: itemData[2],
//         price: itemPrice,
//         quantity: quantity,
//       );
//
//       orderDetails.add(detail);
//     }
//
//     // Save data
//     await saveDataAndShowToast(order, orderDetails);
//
//     // Add the saved order to the list of saved orders
//     savedOrders.add(order);
//
//     // Clear user inputs and selected values
//     _textField1Controller.clear();
//     _textField2Controller.clear();
//     _textField3Controller.clear();
//     _textField4Controller.clear();
//     selectedDropdownValues.clear();
//     itemQuantities.clear();
//
//     // Update the UI
//     setState(() {});
//
//     // You can navigate to a different screen or perform other actions here
//   }
//
//
//   Future<void> saveDataAndShowToast(OrderMaster order,
//       List<OrderDetails> orderDetails) async {
//     try {
//       // Save data to the database
//       await insertOrderMaster(order);
//       for (final detail in orderDetails) {
//         await insertOrderDetails(detail);
//       }
//
//       // Show a success toast message
//       Fluttertoast.showToast(
//         msg: 'Data saved successfully!',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//       );
//
//       //Optionally, create a text file
//       final file = File(
//           '${await getApplicationDocumentsDirectory()}/order_data.txt');
//       var fileContent = 'Order ID: ${order.orderId}\n'
//           'Shop Name: ${order.shopName}\n'
//           'Owner Name: ${order.ownerName}\n'
//           'Phone No: ${order.phoneNo}\n'
//           'Brand: ${order.brand}\n';
//
//       for (final detail in orderDetails) {
//         fileContent += 'Product ID: ${detail.productCode }\n'
//             'Product Name: ${detail.productName}\n'
//             'UOM: ${detail.uom}\n'
//             'Price: ${detail.price}\n'
//             'Quantity: ${detail.quantity}\n';
//       }
//
//       await file.writeAsString(fileContent);
//     } catch (e) {
//       // Show an error toast message
//       Fluttertoast.showToast(
//         msg: 'Error: $e',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
//
//       // Navigate to the SavedOrdersPage and pass the savedOrders list
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Saved
//           OrdersPage(savedOrders: savedOrders),
//         ),
//       );
//     }
//
//   }
//
//
//
//   Widget buildTextField(String label, TextEditingController controller) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 16, color: Colors.black),
//         ),
//         SizedBox(height: 10),
//         TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildCustomDropdown(List<String> selectedValues, List<String> items) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Item Description',
//           style: TextStyle(fontSize: 16, color: Colors.black),
//         ),
//         SizedBox(height: 10),
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(5.0),
//           ),
//           child: Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   showDropdownList(selectedValues, dropdownItems);
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(8.0),
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: Text(
//                           selectedValues.isEmpty
//                               ? 'Select item(s)'
//                               : selectedValues.join(', '),
//                         ),
//                       ),
//                       Icon(Icons.arrow_drop_down),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Column(
//           children: selectedValues.map((item) => buildItemRow(item)).toList(),
//         ),
//       ],
//     );
//   }
//
//   Widget buildItemRow(String item) {
//     final quantity = itemQuantities[item] ?? 0;
//     final TextEditingController quantityController =
//     TextEditingController(text: quantity.toString());
//
//     final productCode = item.split(' ')[0]; // Get the product code
//
//     return Column(
//       children: <Widget>[
//         ListTile(
//           title: Row(
//             children: [
//               Text('ID: $productCode  '),
//               Expanded(
//                 child: Text(item),
//               ),
//               IconButton(
//                 icon: Icon(Icons.remove),
//                 onPressed: () {
//                   if (quantity > 0) {
//                     setState(() {
//                       itemQuantities[item] = quantity - 1;
//                     });
//                   }
//                 },
//               ),
//               SizedBox(
//                 width: 50,
//                 child: TextFormField(
//                   controller: quantityController,
//                   keyboardType: TextInputType.number,
//                   onChanged: (value) {
//                     setState(() {
//                       itemQuantities[item] = int.parse(value);
//                     });
//                   },
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.add),
//                 onPressed: () {
//                   setState(() {
//                     itemQuantities[item] = quantity + 1;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   void showDropdownList(List<String> selectedValues, List<String> items) {
//     final TextEditingController searchController = TextEditingController();
//     final screenSize = MediaQuery
//         .of(context)
//         .size;
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             final List<String> filteredItems = items.where((item) {
//               final query = searchController.text.toLowerCase();
//               return item.toLowerCase().contains(query);
//             }).toList();
//
//             return AlertDialog(
//               title: Text('Select item(s)'),
//               content: SingleChildScrollView(
//                 child: Container(
//                   width: screenSize.width * 0.9,
//                   height: screenSize.height * 0.7,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       TextField(
//                         controller: searchController,
//                         decoration: InputDecoration(
//                           hintText: 'Search for items',
//                         ),
//                         onChanged: (query) {
//                           setState(() {});
//                         },
//                       ),
//                       Container(
//                         height: screenSize.height * 0.5,
//                         child: ListView(
//                           children: filteredItems.map((item) {
//                             return ListTile(
//                               title: Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(item),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.remove),
//                                     onPressed: () {
//                                       final quantity = itemQuantities[item] ??
//                                           0;
//                                       if (quantity > 0) {
//                                         setState(() {
//                                           itemQuantities[item] = quantity - 1;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                   SizedBox(
//                                     width: 50,
//                                     child: TextFormField(
//                                       controller: TextEditingController(
//                                           text: itemQuantities[item]
//                                               .toString()),
//                                       keyboardType: TextInputType.number,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           itemQuantities[item] =
//                                               int.parse(value);
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.add),
//                                     onPressed: () {
//                                       final quantity = itemQuantities[item] ??
//                                           0;
//                                       setState(() {
//                                         itemQuantities[item] = quantity + 1;
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               trailing: TextButton(
//                                 onPressed: () {
//                                   if (selectedValues.contains(item)) {
//                                     setState(() {
//                                       selectedValues.remove(item);
//                                     });
//                                   } else {
//                                     setState(() {
//                                       selectedValues.add(item);
//                                     });
//                                   }
//                                 },
//                                 child: Text(selectedValues.contains(item)
//                                     ? 'Remove'
//                                     : 'Add'),
//                                 style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all<
//                                       Color>(
//                                     selectedValues.contains(item)
//                                         ? Colors.red
//                                         : Colors.green,
//                                   ),
//                                   textStyle: MaterialStateProperty.all<
//                                       TextStyle>(
//                                     TextStyle(color: Colors.white),
//                                   ),
//                                   side: MaterialStateProperty.all<BorderSide>(
//                                     BorderSide(
//                                       color: Colors.black,
//                                       width: 1.0,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Done'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// // Add this method inside your _OrderBookingPageState class
//   List<Widget> _buildSavedOrders() {
//     return savedOrders.map((order) {
//       return Card(
//         child: Column(
//           children: [
//             Text('Shop Name: ${order.shopName}'),
//             Text('Owner Name: ${order.ownerName}'),
//             Text('Phone No: ${order.phoneNo}'),
//             Text('Brand: ${order.brand}'),
//             Text('Order ID: ${order.orderId}'),
//             Text('Order Details:'),
//             Column(
//               children: order.orderDetails.map((detail) {
//                 return ListTile(
//                   title: Text('Product: ${detail.productName}'),
//                   subtitle: Text('Quantity: ${detail.quantity}'),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       );
//     }).toList();
//   }
//
//
// }
//
//
//
