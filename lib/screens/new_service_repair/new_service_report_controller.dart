import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:route_runner/api_call/add_new_service_report_api/add_new_service_report_model.dart';
import 'package:route_runner/model/location_model.dart';

import '../../api_call/add_new_service_report_api/add_new_service_report_api.dart';
import '../../utils/strings.dart';

class NewServiceReportController extends GetxController {
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();

  List<Location>? filteredLocations = [];
  LocationModel? locationModel;
  String data = "";
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
      data = DateFormat('yyyy-MM-dd').format(picked);
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
  NewServiceReportModel newServiceReportModel = NewServiceReportModel();


  Future<bool> addNewServiceRepair({required String machineNumber,
    required String serialNumber,
    required String auditNumber,
    required String date,
    required String time,
    required String employeeName,
    required String serviceRequested,
    required String image,
  })
  async {
    loader.value = true;
    newServiceReportModel =  await CustomerNewServiceReportApi.customerNewServiceReportApi(machineNumber: machineNumber,
      serialNumber: serialNumber,
      auditNumber: auditNumber,
      date: date,
      time: time, employeeName: employeeName, serviceRequested: serviceRequested, image: image,);

    loader.value = false;
    return  loader.value;
  }

  String  downloadUrl = "";
  File? image;
  final ImagePicker picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<void> getImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    loader.value = true;
    if (photo != null) {

      image = File(photo.path);
      if(image != null)
      {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();

        Reference storageReference = _storage.ref().child('images/$fileName');

        UploadTask uploadTask = storageReference.putFile(image!);

        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        downloadUrl = await taskSnapshot.ref.getDownloadURL();
        print("downloadUrl ---------->$downloadUrl");
        loader.value = false;
      }
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
  String imageError = "";

  imageValidation() {
    if (image == null) {
      imageError = StringRes.addImage;
    } else {
      imageError = "";
    }
    update(['newRepair']);
  }

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
    imageValidation();
  }

  validation() {
    val();
    if (machineError == '' &&
        serialError == '' &&
        auditError == '' &&
        dateError == '' &&
        timeError == '' &&
        reporterError == '' &&
        issueError == '' &&
        imageError == '') {
      return true;
    } else {
      return false;
    }
  }
}
