import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  TextEditingController employeeController = TextEditingController();
  TextEditingController enterEmailController = TextEditingController();
  TextEditingController enterMobileController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
      employeeController.text = "Jim Gallagher";
    enterEmailController.text = "melanieolmsted@rapide.com";
    enterMobileController.text = "1234567891";
  }

}
