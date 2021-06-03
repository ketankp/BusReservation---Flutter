import 'package:bus_reservation/utils/api_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var isLoading = true.obs;
  Api api = new Api();
  final storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
  }

  void doLogin(Map<String, dynamic> map) async {
    try {
      isLoading(true);
      var response = await api.doLogin(map);
      if (response != null) {
        storage.write("token", response['token']);
      }
    } finally {
      isLoading(false);
    }
  }
}
