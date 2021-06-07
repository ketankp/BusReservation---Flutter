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
