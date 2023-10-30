
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../Databases/OrderDatabase/DBHelperOrderMaster.dart';
import '../Models/OrderModels/OrderMasterModel.dart';
import '../View_Models/OrderViewModels/OrderDetailsViewModel.dart';
import '../View_Models/OrderViewModels/OrderMasterViewModel.dart';
import '../View_Models/OrderViewModels/ProductsViewModel.dart';
import 'OrderMasterList.dart';
class NewOrderBookingPage extends StatefulWidget {
  const NewOrderBookingPage({Key? key}) : super(key: key);

  @override
  State<NewOrderBookingPage> createState() => _NewOrderBookingPageState();
}
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: NewOrderBookingPage(),
    ),
  ));
}

class _NewOrderBookingPageState extends State<NewOrderBookingPage> {


  final ordermasterViewModel = Get.put(OrderMasterViewModel());
  final orderdetailsViewModel = Get.put(OrderDetailsViewModel());
  final productsViewModel = Get.put(ProductsViewModel());


  final shopNameController = TextEditingController();
  final ownerNameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final brandController = TextEditingController();


  int? ordermasterId;
  int? orderdetailsId;
  int? productsId;

  List<String> selectedDropdownValues = [];
  Map<String, int> itemQuantities = {};
  List<String> dropdownItems = [];
  var data;
  final db= DBHelperOrderMaster();


  getMasterTableData() async{
    var productData = await db.getMasterTable();
    if (productData != null) {
      data = productData;
      int a=0;
      for(var i in data){
        a++;
        var result=await postMasterTableData(i["orderId"].toString(),i["shopName"].toString(),i["ownerName"].toString(),i["phoneNo"].toString(),i["brand"].toString());
        if(result==true){
          Fluttertoast.showToast(msg: i["orderId"].toString(), toastLength: Toast.LENGTH_SHORT);
        }
        else{
          Fluttertoast.showToast(msg: i["orderId"].toString(), toastLength: Toast.LENGTH_SHORT);
        }
      }

    } else {
      data = "No product found.";
    }
  }
  postMasterTableData <bool> (String id, String shop_name, String owner_name, String phone_no, String brand) async{
    try {
      var response = await post(
          Uri.parse('https://g04d40198f41624-i0czh1rzrnvg0r4l.adb.me-dubai-1.oraclecloudapps.com/ords/courage/ordermaster/post '),
          body: {
            'orderId' : id,
            'shopName' : shop_name,
            'ownerName' : owner_name,
            'phoneNo':phone_no,
            'brand': brand
          }
      );
      print(response.statusCode);
      if(response.statusCode==200){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print("error ${e.toString()}");
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('Order Booking'),
  centerTitle: true,
  backgroundColor: Colors.white,
  ),
  body: SingleChildScrollView(
  padding: const EdgeInsets.all(20.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
  buildTextField('Shop Name', shopNameController),
  buildTextField('Owner Name', ownerNameController),
  buildTextField('Phone No',phoneNoController),
  buildTextField('Brand', brandController),
  buildCustomDropdown(selectedDropdownValues, dropdownItems),
  SizedBox(height: 10),
  Align(
  alignment: Alignment.center,
  child: ElevatedButton(
  onPressed: () async{
    if (shopNameController.text != "") {
      ordermasterViewModel.addOrderMaster(OrderMasterModel(
       orderId: ordermasterId,
        shopName: shopNameController.text,
        ownerName: ownerNameController.text,
        phoneNo: phoneNoController.text,
        brand:  brandController.text ,
      ));

      shopNameController.text = "";


      ownerNameController.text = "";

      phoneNoController.text = "";
     brandController.text="";







      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OrderMasterList(savedOrderMasterData: ordermasterViewModel.allOrderMaster),
        ),
      );

      await getMasterTableData();
    }
  },
  style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(
  Colors.blue),
  ),
  child: Text('Submit'),
  ),
  ),
  // Display saved orders

  ],
  ),
  ),
  );
  }



  Widget buildTextField(String label, TextEditingController controller) {
  return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
  label,
  style: TextStyle(fontSize: 16, color: Colors.black),
  ),
  SizedBox(height: 10),
  TextFormField(
  controller: controller,
  decoration: InputDecoration(
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  ),
  ),
  ),
  ],
  );
  }

  Widget buildCustomDropdown(List<String> selectedValues, List<String> items) {
  return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
  'Item Description',
  style: TextStyle(fontSize: 16, color: Colors.black),
  ),
  SizedBox(height: 10),
  Container(
  decoration: BoxDecoration(
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(5.0),
  ),
  child: Column(
  children: <Widget>[
  GestureDetector(
  onTap: () {
  showDropdownList(selectedValues, dropdownItems);
  },
  child: Container(
  padding: EdgeInsets.all(8.0),
  child: Row(
  children: <Widget>[
  Expanded(
  child: Text(
  selectedValues.isEmpty
  ? 'Select item(s)'
      : selectedValues.join(', '),
  ),
  ),
  Icon(Icons.arrow_drop_down),
  ],
  ),
  ),
  ),
  ],
  ),
  ),
  Column(
  children: selectedValues.map((item) => buildItemRow(item)).toList(),
  ),
  ],
  );
  }

  Widget buildItemRow(String item) {
  final quantity = itemQuantities[item] ?? 0;
  final TextEditingController quantityController =
  TextEditingController(text: quantity.toString());

  final productCode = item.split(' ')[0]; // Get the product code

  return Column(
  children: <Widget>[
  ListTile(
  title: Row(
  children: [
  Text('ID: $productCode  '),
  Expanded(
  child: Text(item),
  ),
  IconButton(
  icon: Icon(Icons.remove),
  onPressed: () {
  if (quantity > 0) {
  setState(() {
  itemQuantities[item] = quantity - 1;
  });
  }
  },
  ),
  SizedBox(
  width: 50,
  child: TextFormField(
  controller: quantityController,
  keyboardType: TextInputType.number,
  onChanged: (value) {
  setState(() {
  itemQuantities[item] = int.parse(value);
  });
  },
  ),
  ),
  IconButton(
  icon: Icon(Icons.add),
  onPressed: () {
  setState(() {
  itemQuantities[item] = quantity + 1;
  });
  },
  ),
  ],
  ),
  ),
  ],
  );
  }

  void showDropdownList(List<String> selectedValues, List<String> items) {
  final TextEditingController searchController = TextEditingController();
  final screenSize = MediaQuery
      .of(context)
      .size;

  showDialog(
  context: context,
  builder: (BuildContext context) {
  return StatefulBuilder(
  builder: (context, setState) {
  final List<String> filteredItems = items.where((item) {
  final query = searchController.text.toLowerCase();
  return item.toLowerCase().contains(query);
  }).toList();

  return AlertDialog(
  title: Text('Select item(s)'),
  content: SingleChildScrollView(
  child: Container(
  width: screenSize.width * 0.9,
  height: screenSize.height * 0.7,
  child: Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
  TextField(
  controller: searchController,
  decoration: InputDecoration(
  hintText: 'Search for items',
  ),
  onChanged: (query) {
  setState(() {});
  },
  ),
  Container(
  height: screenSize.height * 0.5,
  child: ListView(
  children: filteredItems.map((item) {
  return ListTile(
  title: Row(
  children: [
  Expanded(
  child: Text(item),
  ),
  IconButton(
  icon: Icon(Icons.remove),
  onPressed: () {
  final quantity = itemQuantities[item] ??
  0;
  if (quantity > 0) {
  setState(() {
  itemQuantities[item] = quantity - 1;
  });
  }
  },
  ),
  SizedBox(
  width: 50,
  child: TextFormField(
  controller: TextEditingController(
  text: itemQuantities[item]
      .toString()),
  keyboardType: TextInputType.number,
  onChanged: (value) {
  setState(() {
  itemQuantities[item] =
  int.parse(value);
  });
  },
  ),
  ),
  IconButton(
  icon: Icon(Icons.add),
  onPressed: () {
  final quantity = itemQuantities[item] ??
  0;
  setState(() {
  itemQuantities[item] = quantity + 1;
  });
  },
  ),
  ],
  ),
  trailing: TextButton(
  onPressed: () {
  if (selectedValues.contains(item)) {
  setState(() {
  selectedValues.remove(item);
  });
  } else {
  setState(() {
  selectedValues.add(item);
  });
  }
  },
  child: Text(selectedValues.contains(item)
  ? 'Remove'
      : 'Add'),
  style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all<
  Color>(
  selectedValues.contains(item)
  ? Colors.red
      : Colors.green,
  ),
  textStyle: MaterialStateProperty.all<
  TextStyle>(
  TextStyle(color: Colors.white),
  ),
  side: MaterialStateProperty.all<BorderSide>(
  BorderSide(
  color: Colors.black,
  width: 1.0,
  ),
  ),
  ),
  ),
  );
  }).toList(),
  ),
  ),
  ],
  ),
  ),
  ),
  actions: <Widget>[
  TextButton(
  onPressed: () {
  Navigator.pop(context);
  },
  child: Text('Done'),
  ),
  ],
  );
  },
  );
  },
  );
  }
// Add this method inside your _OrderBookingPageState class


  }



