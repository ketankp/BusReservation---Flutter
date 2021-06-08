import 'package:bus_reservation/controller/homepage_controller.dart';
import 'package:bus_reservation/screens/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
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
                    child: Material(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.pink[800],
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.search),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.08,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(fontSize: 18),
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
        border: OutlineInputBorder(),
      ),
      controller: controller,
      onTap: () {
        homePageController.getLocationData();
        Get.to(() => SearchPage(label: label));
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
        padding: EdgeInsets.all(5),
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
              },
            ),
            InkWell(
              child: Text("Tomarrow"),
              onTap: () {
                homePageController.selectedDate =
                    DateTime.now().add(Duration(days: 1));
              },
            ),
          ],
        ),
      ),
    ),
  );
}
