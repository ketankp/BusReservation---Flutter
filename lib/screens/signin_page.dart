import 'package:bus_reservation/constants/constants.dart';
import 'package:bus_reservation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _usernameTEC = new TextEditingController();
  TextEditingController _emailTEC = new TextEditingController();
  TextEditingController _passwordTEC = new TextEditingController();
  TextEditingController _password2TEC = new TextEditingController();
  TextEditingController _firstNameTEC = new TextEditingController();
  TextEditingController _lastNameTEC = new TextEditingController();
  Map<String, dynamic> map = new Map<String, dynamic>();
  AuthController authController = Get.find();

  void validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      map[Constants.username] = _usernameTEC.text;
      map[Constants.email] = _emailTEC.text;
      map[Constants.password] = _passwordTEC.text;
      map[Constants.password2] = _password2TEC.text;
      map[Constants.firstName] = _firstNameTEC.text;
      map[Constants.lastName] = _lastNameTEC.text;
      authController.doSignIn(map);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _userName(_usernameTEC),
                _email(_emailTEC),
                _name(_firstNameTEC, "First Name"),
                _name(_lastNameTEC, "Last Name"),
                _password(_passwordTEC),
                _password2(_password2TEC),
                TextButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus!.unfocus();
                    validateAndSubmit();
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _userName(TextEditingController username) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.amber[800],
        ),
        labelText: "Username",
        hintText: "abc",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelStyle: TextStyle(color: Colors.amber[800]),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Username";
        }
        return null;
      },
      controller: username,
    ),
  );
}

Widget _email(TextEditingController email) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "abc@gmail.com",
        prefixIcon: Icon(
          Icons.email,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.amber),
        ),
      ),
      controller: email,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter valid email";
        }
        return null;
      },
    ),
  );
}

Widget _password(TextEditingController password) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.amber),
        ),
      ),
      controller: password,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Password";
        }
        return null;
      },
      obscureText: true,
    ),
  );
}

Widget _password2(TextEditingController password2) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: "Confirm Password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.amber),
        ),
      ),
      controller: password2,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Password";
        }
        return null;
      },
      obscureText: true,
    ),
  );
}

Widget _name(TextEditingController name, String label) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.text_format),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.amber),
        ),
      ),
      controller: name,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter valid $label";
        }
        return null;
      },
    ),
  );
}
