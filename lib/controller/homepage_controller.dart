import 'package:bus_reservation/constants/constants.dart';
import 'package:bus_reservation/modals/location_modal.dart';
import 'package:bus_reservation/utils/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  Api api = new Api();
  final storage = GetStorage();
  var tabIndex = PageController();
  TextEditingController sourceTEC = new TextEditingController();
  TextEditingController destinationTEC = new TextEditingController();
  var temp;
  List<Location> locationList = [];
  late RxString pickDate = DateFormat('EEEE, d').format(DateTime.now()).obs;
  late DateTime? selectedDate = null.obs as DateTime?;
  late Location sourceLocation, destinationLocation;

  @override
  void onInit() {
    getLocationData();
    super.onInit();
  }

  void getLocationData() async {
    String token = "token " + storage.read(Constants.token);
    List<dynamic> list = await api.getData("location", token).timeout(
          const Duration(
            seconds: 5,
          ),
        );
    locationList.clear();
    list.forEach((element) {
      //locationList.add(element['name'] + ", " + element['district']);
      locationList.add(Location.fromJson(element));
    });
    update();
  }

  Future<List<Location>> getSuggestions(String pattern) async {
    List<Location> result = [];
    result.addAll(locationList);
    result.retainWhere((element) =>
        element.name.toLowerCase().contains(pattern.toLowerCase()));
    return result;
  }

  Future<dynamic> getDate(BuildContext context) async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    pickDate.value = DateFormat('EEEE, d').format(selectedDate!);
    update();
  }
}
