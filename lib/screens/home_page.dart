import 'package:bus_reservation/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Bus Reservation"),
            ),
            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                Text("Home"),
                Text("booking"),
                Text("account"),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: "My Booking",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: "My Account",
                ),
              ],
            ),
          );
        });
  }
}
