import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:route_runner/model/location_model.dart';

class NewReportController extends GetxController {
  RxBool loader = false.obs;
   ScrollController scrollController = ScrollController();

  List<Location>? filteredLocations = [];
  LocationModel? locationModel;

 TextEditingController dateController = TextEditingController();
 TextEditingController timeController = TextEditingController();
 TextEditingController machineNumberController = TextEditingController();
 TextEditingController auditNumberController = TextEditingController();
 TextEditingController reporterController = TextEditingController();
 TextEditingController issueController = TextEditingController();
 TextEditingController enterSerialNumberController = TextEditingController();
 TextEditingController enterCurrentNumberController = TextEditingController();

/// select date function
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      dateController.text = DateFormat('dd MMM, yyyy').format(picked);
      // Handle the selected date, e.g., update a variable or display it
      print('Selected date: ${  dateController.text}');
    }
    update(['newRepair']);
  }

  /// select time function
  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      timeController.text = DateFormat('h:mm a').format(
        DateTime(2022, 1, 1, picked.hour, picked.minute),
      );
      // Handle the selected time, e.g., update a variable or display it
      print('Selected time: ${timeController.text}');
    }
    update(['newRepair']);
  }




  File? image;
  final ImagePicker picker = ImagePicker();
  Future<void> getImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {

        image = File(photo.path);
    }
    update(['newRepair']);
  }

}
