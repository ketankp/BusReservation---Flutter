import 'package:bus_reservation/controller/login_controller.dart';
import 'package:bus_reservation/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Reservation"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              loginController.storage.remove("token");
              Get.offAll(LoginPage());
            },
            child: Text("LogOut"),
          ),
        ),
      ),
    );
  }
}
