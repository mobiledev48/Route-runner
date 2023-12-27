import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:route_runner/model/location_model.dart';

class NewCollectionController extends GetxController {
  RxBool loader = false.obs;
   ScrollController scrollController = ScrollController();

  List<Location>? filteredLocations = [];
  LocationModel? locationModel;

 TextEditingController machineNumberController = TextEditingController();
 TextEditingController auditNumberController = TextEditingController();
 TextEditingController enterSerialNumberController = TextEditingController();
 TextEditingController enterCurrentNumberController = TextEditingController();


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
