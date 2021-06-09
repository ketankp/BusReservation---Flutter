import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your ticket details"),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Wrap(
            children: [
              Material(
                elevation: 20,
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                child: _firstBox(),
              ),
              Material(
                elevation: 20,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: _secondBox(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: TextButton(
                onPressed: () {
                  print("Cancel");
                },
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.xmark,
                      color: Colors.amber[800],
                    ),
                    SizedBox(width: 5),
                    _text("Cancel", 15, Colors.amber[800]!)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: TextButton(
                onPressed: () {
                  print("Share");
                },
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.amber[800],
                    ),
                    SizedBox(width: 5),
                    _text("Share", 15, Colors.amber[800]!)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _firstBox() {
  return Padding(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        Row(children: [
          Wrap(
            direction: Axis.vertical,
            children: [
              _text("30 Sep", 15, Colors.black),
              SizedBox(height: 4),
              _text("Monday", 18, Colors.black)
            ],
          ),
          SizedBox(width: 30),
          Wrap(
            direction: Axis.vertical,
            children: [
              _text("Raat Rani", 15, Colors.black),
              SizedBox(height: 4),
              _text("Semi Luxury", 18, Colors.black)
            ],
          ),
        ]),
        SizedBox(height: 12),
        Divider(
          color: Colors.black,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _text("08:00 PM", 20, Colors.black),
            _text("- - - - - -", 15, Colors.black),
            _text("12:20 AM", 20, Colors.black),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _text("Roha", 18, Colors.black),
            _text("Panvel", 18, Colors.black)
          ],
        ),
      ],
    ),
  );
}

Widget _secondBox() {
  return Padding(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _text("Seat No", 15, Colors.grey),
              flex: 3,
            ),
            Expanded(
              child: _text("8 - Ketan", 15, Colors.black),
              flex: 7,
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(
              child: _text("Ticket No", 15, Colors.grey),
              flex: 3,
            ),
            Expanded(
              child: _text("12234", 15, Colors.black),
              flex: 7,
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(
              child: _text("Price", 15, Colors.grey),
              flex: 3,
            ),
            Expanded(
              child: _text("1000", 15, Colors.black),
              flex: 7,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _text(String text, double size, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
    ),
  );
}
