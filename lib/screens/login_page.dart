import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController _usernameTEC = new TextEditingController();
  TextEditingController _passwordTEC = new TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void validateAndSave() {
    if (_formKey.currentState.validate()) {
      print("${_usernameTEC.text}");
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
