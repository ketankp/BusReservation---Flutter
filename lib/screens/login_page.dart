import 'package:bus_reservation/controller/login_controller.dart';
import 'package:bus_reservation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController _usernameTEC = new TextEditingController();
  TextEditingController _passwordTEC = new TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Map<String, dynamic> map = new Map<String, dynamic>();
  LoginController loginController = Get.find();

  void validateAndSave() {
    if (_formKey.currentState.validate()) {
      map['username'] = _usernameTEC.text;
      map['password'] = _passwordTEC.text;
      loginController.doLogin(map);
      print(loginController.storage.read("token"));
      Get.offAll(HomePage());
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
                showLoaderDialog(context);
                validateAndSave();
              },
              child: Text("Login"),
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
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: "Username",
        hintText: "abc",
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelStyle: TextStyle(),
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

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
