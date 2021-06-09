import 'package:bus_reservation/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BookingPage extends StatelessWidget {
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text(homePageController.sourceLocation.name),
          Icon(Icons.arrow_right_alt),
          Text(homePageController.destinationLocation.name),
        ]),
      ),
      body: Container(),
    );
  }
}
