// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:route_runner/utils/strings.dart';


class ForgotPasswordController extends GetxController {
  bool emailTextActive = false;

  TextEditingController emailController = TextEditingController();

  String emailError = "";

  emailValidation() {
    if (emailController.text.trim() == "") {
      emailTextActive = false;
      emailError = StringRes.enterEmail;
      update(['reset']);
    } else {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        emailError = '';
        update(['reset']);
      } else {
        emailTextActive = false;
        emailError = StringRes.enterValidEmail;
        update(['reset']);
      }
    }
  }

  onTapSubmit() {
    if (validation()) {

      emailController.clear();
      Get.back();
    }
    update(['reset']);
  }

  bool validation() {
    emailValidation();

    if (emailError == '') {
      return true;
    } else {
      return false;
    }
  }
}
