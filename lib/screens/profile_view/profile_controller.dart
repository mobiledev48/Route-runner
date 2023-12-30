import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:route_runner/model/location_model.dart';

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

  File? image;
  final ImagePicker picker = ImagePicker();
  Future<void> getImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      image = File(photo.path);
    }
    update(['collection']);
  }
}
