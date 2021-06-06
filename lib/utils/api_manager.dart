import 'package:bus_reservation/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class Api {
  final token = "";

  Future<dynamic> doLogin(Map<String, dynamic> json) async {
    Uri url = Uri.parse(Constants.baseUrl + "api-login/");
    http.Response response = await http.post(url, body: json);
    return JSON.json.decode(response.body);
  }

  Future<dynamic> doSignIn(Map<String, dynamic> json) async {
    Uri url = Uri.parse(Constants.baseUrl + "register/");
    http.Response response = await http.post(url, body: json);
    if (response.statusCode != 201) {
      return JSON.json.decode(response.body);
    } else if (response.statusCode == 201) {
      Map<String, dynamic> map = {};
      map[Constants.statusBody] = "true";
      return map;
    } else {
      return null;
    }
  }
}
