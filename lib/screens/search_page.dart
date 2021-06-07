import 'package:bus_reservation/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  final String label;
  HomePageController homePageController = Get.find();
  SearchPage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (homePageController.sourceTEC.text ==
            homePageController.destinationTEC.text) {
          this.label == "Source Location"
              ? homePageController.sourceTEC.clear()
              : homePageController.destinationTEC.clear();
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.label),
        ),
        body: Container(
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(
                hintText: "Search Location",
                border: OutlineInputBorder(),
              ),
              controller: this.label == "Source Location"
                  ? homePageController.sourceTEC
                  : homePageController.destinationTEC,
            ),
            suggestionsCallback: (String location) {
              print(location);
              return homePageController.getSuggestions(location);
            },
            itemBuilder: (BuildContext context, String itemData) {
              return ListTile(title: Text(itemData));
            },
            onSuggestionSelected: (String? location) {
              this.label == "Source Location"
                  ? homePageController.sourceTEC.text = location!
                  : homePageController.destinationTEC.text = location!;
              if (homePageController.sourceTEC.text ==
                  homePageController.destinationTEC.text) {
                Get.snackbar("Error", "Source and Destination cannot be same");
              } else {
                Get.back();
              }
            },
          ),
        ),
      ),
    );
  }
}
