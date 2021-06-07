import 'package:bus_reservation/modals/user_modal.dart';
import 'package:bus_reservation/utils/api_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController {
  Api api = new Api();
  final storage = GetStorage();
  late User user;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    String token = "token " + storage.read("token");
    List<dynamic> map = await api.getData("user", token).timeout(
          const Duration(
            seconds: 5,
          ),
        ) as List;
    user = User.fromJson(map[0]);
    update();
  }
}
