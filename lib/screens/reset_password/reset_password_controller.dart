import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/reset_password/reset_password_api.dart';
import 'package:route_runner/api_call/reset_password/reset_password_model.dart';
import 'package:route_runner/screens/admin_view/admin_screen.dart';

import '../../utils/strings.dart';

class ResetPasswordController extends GetxController{
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
String passwordError ='';
String conPasswordError ='';
RxBool loader = false.obs;
  passwordValidation() {
    if (passwordController.text.trim() == "") {
      // errorToast(StringRes.enterPasswordError.tr);
      passwordError = StringRes.enterPasswordError.tr;
      update(['reset-pass']);
      return false;
    } else {
      if (passwordController.text.trim().length >= 8) {
        passwordError = '';
        update(['reset-pass']);
        return true;
      } else {
        // errorToast(StringRes.passwordMustBe.tr);
        passwordError = StringRes.passwordMustBe.tr;
        update(['reset-pass']);
        return false;
      }
    }
  }

  conPasswordValidation() {
    if (conPasswordController.text.trim() == "") {
      // errorToast(StringRes.enterPasswordError.tr);
      conPasswordError = StringRes.enterPasswordError.tr;
      update(['reset-pass']);
      return false;
    } else {
      if (conPasswordController.text.trim().length >= 8) {

        if(conPasswordController.text == passwordController.text){

        conPasswordError = '';
        }
        else
          {
            conPasswordError = StringRes.confirmPassword.tr;
          }
        update(['reset-pass']);
        return true;
      } else {
        // errorToast(StringRes.passwordMustBe.tr);
        conPasswordError = StringRes.passwordMustBe.tr;
        update(['reset-pass']);
        return false;
      }
    }
  }



  validation(){
    passwordValidation();
    conPasswordValidation();
    update(['reset-pass']);


  }
ResetPasswordModel resetPasswordModel = ResetPasswordModel();
  resetPassword(employeeId)async{
    loader.value = true;
   resetPasswordModel  = await ResetPasswordApi.resetPasswordApi(password: passwordController.text, employeeId: employeeId);
   if(resetPasswordModel.success ?? false)
     {
       Get.offAll(const AdminScreen());
     }
    loader.value = false;

  }

}