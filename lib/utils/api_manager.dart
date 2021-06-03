import 'package:bus_reservation/constants/constants.dart';

class Api {
  final token = "";

  Future<Null> doLogin() async {
    Uri url = Uri.parse(Constants.baseUrl + "api-login/");
  }
}
