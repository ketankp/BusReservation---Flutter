import 'package:bus_reservation/screens/account_page.dart';
import 'package:bus_reservation/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTab extends StatelessWidget {
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
              accountName: Text("accountName"),
              accountEmail: Text("accountEmail"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
          ),
          _cardView("My Account", AccountPage()),
          _cardView("Logout", LoginPage()),
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
