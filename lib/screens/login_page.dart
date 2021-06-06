import 'package:bus_reservation/constants/constants.dart';
import 'package:bus_reservation/controller/auth_controller.dart';
import 'package:bus_reservation/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController _usernameTEC = new TextEditingController();
  TextEditingController _passwordTEC = new TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Map<String, dynamic> map = new Map<String, dynamic>();
  AuthController authController = Get.find();

  void validateAndSave() {
    if (_formKey.currentState.validate()) {
      map[Constants.username] = _usernameTEC.text;
      map[Constants.password] = _passwordTEC.text;
      authController.doLogin(map);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Reservation"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userName(_usernameTEC),
            _passWord(_passwordTEC),
            TextButton(
              onPressed: () {
                validateAndSave();
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Get.to(SignInPage());
              },
              child: Text("Create account"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _userName(TextEditingController usernameTEC) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: TextFormField(
      enabled: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: "Username",
        hintText: "abc",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.amber),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Enter Username";
        }
        return null;
      },
      controller: usernameTEC,
    ),
  );
}

Widget _passWord(TextEditingController passwordTEC) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelStyle: TextStyle(),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Enter Password";
        }
        return null;
      },
      controller: passwordTEC,
      obscureText: true,
    ),
  );
}
