import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/strings.dart';

class ResetPasswordController extends GetxController{
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();
String passwordError ='';
String conPasswordError ='';
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
}