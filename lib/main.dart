import 'package:flutter/material.dart';
import 'package:order_booking_shop/Views/ShopListPage.dart';
import 'package:provider/provider.dart';
import 'Models/ShopProvider.dart';

void main() {
  runApp(
    MaterialApp( // Wrap with MaterialApp
      home: ChangeNotifierProvider(
        create: (context) => ShopProvider(),
        child: Scaffold(
          backgroundColor: Colors.greenAccent,
          body: Center(
            child: LoginForm(),
          ),
        ),
      ),
    ),
  );
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _forgotPassword() {
    // Navigate to the second page
    Navigator.push(context, MaterialPageRoute(builder: (context) => ShopListPage()));
  }

  void _login() {
    // Add the login logic here
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.white, width: 1),
            ),
            child: Container(
              width: 400,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'User ID',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Container(
                    margin: EdgeInsets.all(1.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(12.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.white, width: 1),
            ),
            child: Container(
              width: 400,
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Container(
                    margin: EdgeInsets.all(1.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(12.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(height: 20.0),

          // Login button with arrow icon
          Container(
            height: 40,
            width: 400,
            child: ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Background color of the button
                onPrimary: Colors.black, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0), // Border radius
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(Icons.arrow_forward), // Arrow icon
                ],
              ),
            ),
          ),

          SizedBox(height: 10), // Add some spacing



          // "Forgot Password" text button
          TextButton(
            onPressed: _forgotPassword,
            child: Text(
              'Forgot Password',
              style: TextStyle(
                color: Colors.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
