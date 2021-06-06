import 'package:bus_reservation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  AuthController authController = Get.find();
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
              authController.doLogout();
            },
            child: Text("LogOut"),
          ),
        ),
      ),
    );
  }
}
