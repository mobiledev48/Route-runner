import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLController extends GetxController{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> enterLocation =
      TextEditingController().obs;
  Rx<TextEditingController> passwordC =
      TextEditingController().obs;
}