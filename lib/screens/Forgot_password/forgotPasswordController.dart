// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/forgot_password_api/forgot_password_api.dart';
import 'package:route_runner/api_call/forgot_password_api/forgot_password_model.dart';
import 'package:route_runner/screens/Otp_screen/otp_screen.dart';
import 'package:route_runner/utils/strings.dart';


class ForgotPasswordController extends GetxController {
  bool emailTextActive = false;
RxBool loader = false.obs;
  TextEditingController emailController = TextEditingController();

  String emailError = "";
ForgotPasswordModel forgotPasswordModel =ForgotPasswordModel();
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

  onTapSubmit() async {
    if (validation()) {
      loader.value  = true;
    forgotPasswordModel = await  ForgotPasswordApi.forgotPasswordApi(email: emailController.text,);
    if(forgotPasswordModel.success ?? false) {
      Get.to(OtpScreen(email: emailController.text,employeeId:forgotPasswordModel.user?.id.toString() ?? ''));

    }
      loader.value  = false;

      emailController.clear();
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
