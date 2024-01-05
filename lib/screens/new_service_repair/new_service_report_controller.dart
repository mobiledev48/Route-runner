import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:route_runner/model/location_model.dart';

import '../../utils/strings.dart';

class NewServiceReportController extends GetxController {
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();

  List<Location>? filteredLocations = [];
  LocationModel? locationModel;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController machineNumberController = TextEditingController();
  TextEditingController auditNumberController = TextEditingController();
  TextEditingController employeeController = TextEditingController();
  TextEditingController serviceRequestedController = TextEditingController();
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
      print('Selected date: ${dateController.text}');
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

  String machineError = "";
  String serialError = "";
  String auditError = "";
  String dateError = "";
  String timeError = "";
  String reporterError = "";
  String issueError = "";

  machineValidation() {
    if (machineNumberController.text.trim() == "") {
      machineError = StringRes.machineError;
    } else {
      machineError = '';
    }
    update(['newRepair']);
  }

  serialValidation() {
    if (enterSerialNumberController.text.trim() == "") {
      serialError = StringRes.serialError;
    } else {
      serialError = '';
    }
    update(['newRepair']);
  }

  auditValidation() {
    if (auditNumberController.text.trim() == "") {
      auditError = StringRes.auditError;
    } else {
      auditError = '';
    }
    update(['newRepair']);
  }

  dateValidation() {
    if (dateController.text.trim() == "") {
      dateError = StringRes.dateError;
    } else {
      dateError = '';
    }
    update(['newRepair']);
  }

  timeValidation() {
    if (timeController.text.trim() == "") {
      timeError = StringRes.timeError;
    } else {
      timeError = '';
    }
    update(['newRepair']);
  }

  reporterValidation() {
    if (employeeController.text.trim() == "") {
      reporterError = StringRes.reporterError;
    } else {
      reporterError = '';
    }
    update(['newRepair']);
  }

  issueValidation() {
    if (serviceRequestedController.text.trim() == "") {
      issueError = StringRes.issueError;
    } else {
      issueError = '';
    }
    update(['newRepair']);
  }

  val() async {
    machineValidation();
    serialValidation();
    auditValidation();
    dateValidation();
    timeValidation();
    reporterValidation();
    issueValidation();
  }

  validation() {
    val();
    if (machineError == '' &&
        serialError == '' &&
        auditError == '' &&
        dateError == '' &&
        timeError == '' &&
        reporterError == '' &&
        issueError == '') {
      return true;
    } else {
      return false;
    }
  }
}
