import 'package:bus_reservation/screens/confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              _card(context),
              _card(context),
              _card(context),
              _card(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _card(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ConfirmationPage());
        },
        child: Card(
          elevation: 6,
          color: Colors.amber[200],
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text(
                  DateFormat("EEEE,MMM d, yyyy").format(DateTime.now()),
                  12,
                  Colors.black,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _text("From", 12, Colors.grey[600]),
                    _text("To", 12, Colors.grey[600]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _text("Roha", 18, Colors.black),
                    _text("Panvel", 18, Colors.black),
                  ],
                ),
                SizedBox(height: 8),
                _text("Boards", 12, Colors.grey[600]),
                _text("10:40 PM", 15, Colors.black),
                SizedBox(height: 8),
                _text("Bus Type", 12, Colors.grey[600]),
                _text("Semi Luxury", 15, Colors.black),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _text(String text, double size, Color? color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
    ),
  );
}
