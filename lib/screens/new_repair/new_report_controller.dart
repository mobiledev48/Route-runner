import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:route_runner/api_call/add_new_repair_api/add_new_repair_model.dart';
import 'package:route_runner/api_call/get_location_api/get_location_api.dart';
import 'package:route_runner/api_call/get_location_api/get_location_model.dart';
import 'package:route_runner/model/location_model.dart';

import '../../api_call/add_new_repair_api/add_new_rapair_api.dart';
import '../../utils/strings.dart';

class NewReportController extends GetxController {
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();

  List<Location>? filteredLocations = [];
  LocationModel? locationModel;
  String locationError = "";

  String data = "";

  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController machineNumberController = TextEditingController();
  TextEditingController auditNumberController = TextEditingController();
  TextEditingController reporterController = TextEditingController();
  TextEditingController issueController = TextEditingController();
  TextEditingController enterSerialNumberController = TextEditingController();
  TextEditingController enterCurrentNumberController = TextEditingController();
  AddNewRepairModel  addNewRepairModel  = AddNewRepairModel();

  Future<bool> addNewRepair({
    required String location,
    required String machineNumber,
    required String serialNumber,
    required String auditNumber,
    required String date,
    required String time,
    required String reporterName,
    required String issue,
    required String image,
  })
  async {
    loader.value = true;
    addNewRepairModel =  await CustomerNewRepairApi.customerNewRepairApi(location: location,machineNumber: machineNumber,
      serialNumber: serialNumber,
      auditNumber: auditNumber,
      date: date,
      time: time, reporterName: reporterName, issue: issue, image: image,);

    loader.value = false;
    return  loader.value;
  }
  bool isClick = false;
  String  locationId = "";
  GetLocationModel getLocationModel= GetLocationModel();
  List<LocationsData> locationsData = [];

  getLocation({page, search}) async {
    loader.value = true;
    getLocationModel = await CustomerGetLocationApi.customerGetLocationApi(page: page, search: search);

    if (getLocationModel.locations != null && getLocationModel.locations!.isNotEmpty) {
      // Remove duplicates before adding new locations
      Set<String?> existingIds = locationsData.map((location) => location.sId).toSet();
      List<LocationsData> newLocations = getLocationModel.locations!
          .where((location) => !existingIds.contains(location.sId))
          .toList();

      locationsData.addAll(newLocations);
      update(['collection']);
    }

    loader.value = false;
  }

  locationValidation() {
    if (locationController.text.trim() == "") {
      locationError = StringRes.selectLocation;
    } else {
      locationError = '';
    }
    update(['collection']);
  }


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
    if (reporterController.text.trim() == "") {
      reporterError = StringRes.reporterError;
    } else {
      reporterError = '';
    }
    update(['newRepair']);
  }

  issueValidation() {
    if (issueController.text.trim() == "") {
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
    locationValidation();
  }

  validation() {
    val();
    if ( locationError == '' &&
        machineError == '' &&
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
