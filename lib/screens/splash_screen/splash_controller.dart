import 'package:get/get.dart';
import 'package:route_runner/screens/admin_view/admin_screen.dart';
import 'package:route_runner/screens/dash_board/dash_board_screen.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/pref_keys.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (PrefService.getBool(PrefKeys.login) == true) {
        Get.offAll(() => DashBoardScreen());
      } else {
        Get.offAll(() => const AdminScreen());
      }
    });
    super.onInit();
  }
}
