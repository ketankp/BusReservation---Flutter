import 'package:bus_reservation/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:connectivity_plus/connectivity_plus.dart';

class Api {
  Future<bool> check() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<dynamic> doLogin(Map<String, dynamic> json) async {
    Uri url = Uri.parse(Constants.baseUrl + "api-login/");
    http.Response response = await http.post(url, body: json).timeout(
          const Duration(seconds: 5),
        );
    return JSON.json.decode(response.body);
  }

  Future<dynamic> doSignIn(Map<String, dynamic> json) async {
    Uri url = Uri.parse(Constants.baseUrl + "register/");
    http.Response response = await http.post(url, body: json).timeout(
          const Duration(seconds: 5),
        );
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
