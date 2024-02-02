import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/otp_api/otp_api.dart';
import 'package:route_runner/api_call/otp_api/otp_model.dart';
import 'package:route_runner/screens/reset_password/reset_password.dart';
import 'package:route_runner/utils/strings.dart';

class OtpController extends GetxController{
  TextEditingController otpController = TextEditingController();
  String otpError = "";
  RxBool loader = false.obs;
OtpModel otpModel = OtpModel();
  verifyOtp (employeeId) async {
    loader.value = true;
   otpModel =  await OtpApi.optApi(otp: otpController.text,employeeId: employeeId);
    if(otpModel.success ?? false) {
      Get.offAll(ResetScreen(employeeId : employeeId));
    }
    loader.value = false;
  }

  onTapSubmit() {
    if (otpController.text != '') {
      if (otpController.text.length == 6) {
        otpError = "";

      } else {
        otpError = StringRes.enterValidOtp.tr;
      }
    } else {
      otpError = StringRes.enterOtp.tr;
    }
    update(['otp']);
  }
}