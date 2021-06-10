import 'package:bus_reservation/constants/constants.dart';
import 'package:bus_reservation/controller/auth_controller.dart';
import 'package:bus_reservation/screens/signin_page.dart';
import 'package:flutter/cupertino.dart';
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
    if (_formKey.currentState!.validate()) {
      map[Constants.username] = _usernameTEC.text;
      map[Constants.password] = _passwordTEC.text;
      authController.doLogin(map);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userName(_usernameTEC),
            _passWord(_passwordTEC),
            TextButton(
              onPressed: () {
                FocusManager.instance.primaryFocus!.unfocus();
                validateAndSave();
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                FocusManager.instance.primaryFocus!.unfocus();
                Get.to(() => SignInPage());
              },
              child: Text(
                "Create account",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
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
        prefixIcon: Icon(
          Icons.person,
          color: Colors.amber[800],
        ),
        labelText: "Username",
        labelStyle: TextStyle(color: Colors.amber[800]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.amber),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Username";
        }
        return null;
      },
      controller: usernameTEC,
    ),
  );
}

Widget _passWord(TextEditingController passwordTEC) {
  AuthController authController = Get.find();
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: Obx(
      () => TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.amber[800]),
          labelText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.amber),
          ),
          labelStyle: TextStyle(color: Colors.amber[800]),
          suffixIcon: GestureDetector(
            child: Icon(
                authController.loginPasswordVisible.value
                    ? CupertinoIcons.eye_slash_fill
                    : CupertinoIcons.eye_solid,
                color: Colors.amber[800]),
            onTap: () {
              authController.toggle();
            },
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Password";
          }
          return null;
        },
        controller: passwordTEC,
        obscureText: authController.loginPasswordVisible.value,
      ),
    ),
  );
}
