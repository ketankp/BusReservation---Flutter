import 'package:bus_reservation/controller/homepage_controller.dart';
import 'package:bus_reservation/screens/tabs/booking_tab.dart';
import 'package:bus_reservation/screens/tabs/home_tab.dart';
import 'package:bus_reservation/screens/tabs/profile_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  // HomePage({required Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Bus Reservation"),
            ),
            body: PageView(
              controller: controller.tabIndex,
              children: [
                HomeTab(),
                BookingTab(),
                ProfileTab(),
              ],
            ),
            bottomNavigationBar: ValueBuilder<int?>(
              initialValue: 0,
              builder: (value, updateFn) => Container(
                child: BottomNavigationBar(
                  elevation: 6,
                  fixedColor: Colors.amber[800],
                  currentIndex: value != null ? value : 0,
                  onTap: (tab) {
                    controller.tabIndex.animateToPage(
                      tab,
                      duration: Duration(seconds: 1),
                      curve: Curves.ease,
                    );
                    updateFn(tab);
                  },
                  items: [
                    _bottomNavigatorBarItem(CupertinoIcons.home, "Home"),
                    _bottomNavigatorBarItem(
                        CupertinoIcons.calendar, "My Booking"),
                    _bottomNavigatorBarItem(
                        CupertinoIcons.profile_circled, "My Account"),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

_bottomNavigatorBarItem(IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
