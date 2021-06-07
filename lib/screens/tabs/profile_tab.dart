import 'package:bus_reservation/controller/account_controller.dart';
import 'package:bus_reservation/controller/auth_controller.dart';
import 'package:bus_reservation/screens/account_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProfileTab extends StatelessWidget {
  AccountController accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: UserAccountsDrawerHeader(
              accountName: Text(accountController.user.firstName.capitalizeFirst
                      .toString() +
                  " " +
                  accountController.user.lastName.capitalizeFirst.toString()),
              accountEmail: Text(accountController.user.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  accountController.user.firstName[0].capitalize.toString(),
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
          ),
          _cardView("My Account", AccountPage()),
          _logoutView("Logout"),
        ],
      ),
    );
  }
}

Widget _cardView(String name, Widget page) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: InkWell(
      child: Material(
        color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: () {
        Get.to(() => page);
      },
    ),
  );
}

Widget _logoutView(String name) {
  AuthController authController = Get.find();
  return Padding(
    padding: EdgeInsets.all(10),
    child: InkWell(
      child: Material(
        color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: () {
        authController.doLogout();
      },
    ),
  );
}
