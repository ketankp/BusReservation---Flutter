import 'package:bus_reservation/controller/homepage_controller.dart';
import 'package:bus_reservation/screens/bus_page.dart';
import 'package:bus_reservation/screens/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void validateAndSearch() {
    if (_formKey.currentState!.validate()) {
      Get.to(() => BookingPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Container(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _searchForm("Source Location", controller.sourceTEC),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.12,
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: FloatingActionButton(
                      hoverColor: Colors.amber[800],
                      splashColor: Colors.amber[800],
                      onPressed: () {
                        controller.temp = controller.sourceTEC.text;
                        controller.sourceTEC.text =
                            controller.destinationTEC.text;
                        controller.destinationTEC.text = controller.temp;
                      },
                      child: Icon(CupertinoIcons.arrow_up_arrow_down),
                    ),
                  ),
                  _searchForm(
                      "Destination Location", controller.destinationTEC),
                  _datePicker(context),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.amber[800],
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: TextButton(
                          onPressed: () {
                            validateAndSearch();
                          },
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.search,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.08,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget _searchForm(String label, TextEditingController controller) {
  HomePageController homePageController = Get.find();
  return Padding(
    padding: EdgeInsets.all(15),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: label,
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        border: OutlineInputBorder(),
      ),
      textAlignVertical: TextAlignVertical.center,
      readOnly: true,
      controller: controller,
      onTap: () {
        homePageController.getLocationData();
        Get.to(() => SearchPage(label: label));
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget _datePicker(BuildContext context) {
  HomePageController homePageController = Get.find();
  return Padding(
    padding: EdgeInsets.all(15),
    child: Material(
      color: Colors.grey[350],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.date_range),
            InkWell(
              child:
                  Obx(() => Text(homePageController.pickDate.value.toString())),
              onTap: () {
                homePageController.getDate(context);
              },
            ),
            InkWell(
              child: Text("Today"),
              onTap: () {
                homePageController.selectedDate = DateTime.now();
                Get.to(() => BookingPage());
              },
            ),
            InkWell(
              child: Text("Tomarrow"),
              onTap: () {
                homePageController.selectedDate =
                    DateTime.now().add(Duration(days: 1));
                Get.to(() => BookingPage());
              },
            ),
          ],
        ),
      ),
    ),
  );
}
