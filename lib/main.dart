import 'package:bus_reservation/screens/home_page.dart';
import 'package:bus_reservation/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/login_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: loginController.storage.read("token") == null ||
              loginController.storage.read("token") == ""
          ? LoginPage()
          : HomePage(),
    );
  }
}
