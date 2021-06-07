import 'package:bus_reservation/constants/constants.dart';
import 'package:bus_reservation/utils/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePageController extends GetxController {
  Api api = new Api();
  final storage = GetStorage();
  var tabIndex = PageController();
  TextEditingController sourceTEC = new TextEditingController();
  TextEditingController destinationTEC = new TextEditingController();
  var temp;
  List<String> locationList = [];

  @override
  void onInit() {
    getLocationData();
    super.onInit();
  }

  void getLocationData() async {
    String token = "token " + storage.read(Constants.token);
    List<dynamic> list = await api.getData("location", token);
    locationList.clear();
    list.forEach((element) {
      locationList.add(element['name'] + ", " + element['district']);
    });
    update();
  }

  Future<List<String>> getSuggestions(String pattern) async {
    List<String> result = [];
    result.addAll(locationList);
    result.retainWhere(
        (element) => element.toLowerCase().contains(pattern.toLowerCase()));
    return result;
  }
}
