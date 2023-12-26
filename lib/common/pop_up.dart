import 'package:flutter/material.dart';
import 'package:get/get.dart';



void flutterToast(String value, {String? text}) {
  Get.snackbar(
    text ?? "Success",
    value,
    duration: const Duration(seconds: 1),
    colorText: Colors.white,
    backgroundColor: Colors.green.withOpacity(0.5),
  );
}
void errorToast(String error, {String? text}) {
  Get.snackbar(
    text ?? "Error",
    error,
    duration: const Duration(seconds: 1),
    colorText: Colors.white,
    backgroundColor: Colors.red,
  );
}