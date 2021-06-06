import 'package:bus_reservation/constants/constants.dart';
import 'package:bus_reservation/screens/home_page.dart';
import 'package:bus_reservation/screens/login_page.dart';
import 'package:bus_reservation/utils/api_manager.dart';
import 'package:bus_reservation/utils/loading_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  Api api = new Api();
  final storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
  }

  void doLogin(Map<String, dynamic> map) async {
    try {
      showLoading();
      Map<String, dynamic> response = await api.doLogin(map) as Map;
      if (response.containsKey(Constants.token)) {
        storage.write(Constants.token, response[Constants.token]);
        Get.offAll(HomePage());
      } else if (response.containsKey(Constants.nonFieldErrors)) {
        dismissLoadingWidget();
        showSnackBar(
            Constants.loginFailed, response[Constants.nonFieldErrors][0]);
      }
    } catch (_) {
      Get.snackbar(Constants.loginFailed, Constants.tryAgain);
    }
  }

  void doSignIn(Map<String, dynamic> map) async {
    try {
      // showLoading();
      Map<String, dynamic> response = await api.doSignIn(map) as Map;
      if (response.isNotEmpty) {
        dismissLoadingWidget();
        if (response.containsKey(Constants.username)) {
          showSnackBar(Constants.signInError,
              "${Constants.username.capitalizeFirst} : ${response[Constants.username][0]}");
        } else if (response.containsKey(Constants.email)) {
          showSnackBar(Constants.signInError,
              "${Constants.email.capitalizeFirst} : ${response[Constants.email][0]}");
        } else if (response.containsKey(Constants.password)) {
          showSnackBar(Constants.signInError,
              "${Constants.password.capitalizeFirst} : ${response[Constants.password][0]}");
        } else if (response.containsKey(Constants.statusBody)) {
          doLogin({
            Constants.username: map[Constants.username],
            Constants.password: map[Constants.password]
          });
        }
      }
    } catch (_) {
      Get.snackbar(Constants.registrationFailed, Constants.tryAgain);
    }
  }

  void doLogout() {
    showLoading();
    storage.remove(Constants.token);
    Get.offAll(LoginPage());
  }
}
