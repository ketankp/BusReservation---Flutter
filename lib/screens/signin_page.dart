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
      body: Container(
        color: Colors.grey[400],
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  child: Wrap(
                    children: [
                      _textFormField(_usernameTEC, "Username", false,
                          Icons.person_outline),
                      _textFormField(
                          _emailTEC, "Email", false, Icons.email_outlined),
                      _textFormField(_firstNameTEC, "First Name", false,
                          Icons.text_format_outlined),
                      _textFormField(_lastNameTEC, "Last Name", false,
                          Icons.text_format_outlined),
                      _textFormField(
                          _passwordTEC, "Password", true, Icons.lock_outline),
                      _textFormField(_password2TEC, "Confirm Password", true,
                          Icons.lock_outline),
                      TextButton(
                          onPressed: () {
                            validateAndSubmit();
                          },
                          child: Center(
                            child: Text("Sign Up"),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _textFormField(TextEditingController controller, String name,
    bool obscure, IconData icon) {
  return Padding(
    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
    child: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: name,
        isDense: true,
        errorStyle: TextStyle(height: 0),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        }
        return null;
      },
      controller: controller,
      obscureText: obscure,
    ),
  );
}
