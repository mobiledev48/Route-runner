import 'package:get/get.dart';
import 'package:route_runner/screens/admin_view/admin_screen.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then((value) =>{
      Get.offAll(const AdminScreen())
    });
    super.onInit();
  }
}