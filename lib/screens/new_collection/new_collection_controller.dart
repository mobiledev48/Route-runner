import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:route_runner/api_call/get_location_api/get_location_api.dart';
import 'package:route_runner/api_call/get_location_api/get_location_model.dart';
import 'package:route_runner/model/location_model.dart';
import 'package:route_runner/screens/new_collection/new_collection_screen.dart';

import '../../utils/strings.dart';

class NewCollectionController extends GetxController {
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();

  List<Location>? filteredLocations = [];
  LocationModel? locationModel;
  List<CollectionReport> addCampaignData = [];

// <<<<<<< HEAD
//   TextEditingController machineNumberController = TextEditingController();
//   TextEditingController auditNumberController = TextEditingController();
//   TextEditingController enterSerialNumberController = TextEditingController();
//   TextEditingController enterCurrentNumberController = TextEditingController();
// =======
  TextEditingController machineNumberController = TextEditingController();
  TextEditingController auditNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController previousNumberInController = TextEditingController();
  TextEditingController previousNumberOutController = TextEditingController();
  TextEditingController currentNumberInController = TextEditingController();
  TextEditingController currentNumberOutController = TextEditingController();
  TextEditingController enterSerialNumberController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  String  downloadUrl = "";
  String  locationId = "";
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
    update(['collection']);
  }

  GetLocationModel getLocationModel= GetLocationModel();
  List<LocationsData> locationsData = [];
  getLocation({page,search})
  async {
    loader.value = true;
    getLocationModel = await CustomerGetLocationApi.customerGetLocationApi(page: page,search: search);


        locationsData.addAll(getLocationModel.locations ?? []);




    update(['collection']);
    //  locationsData.addAll(getLocationModel.locations ?? []);
    loader.value = false;
  }


  List machineType = ['4652387645', '876366756', '9576315760'];

  String machineError = "";
  String serialError = "";
  String auditError = "";
  String locationError = "";
  String inPreviousError = "";
  String inCurrentError = "";
  String outPreviousError = "";
  String outCurrentError = "";
  String totalError = "";
  String imageError = "";

  bool isClick = false;

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
    update(['collection']);
  }

  locationValidation() {
    if (locationController.text.trim() == "") {
      locationError = StringRes.pleaseSelectLocation;
    } else {
      locationError = '';
    }
    update(['collection']);
  }


  serialValidation() {
    if (enterSerialNumberController.text.trim() == "") {
      serialError = StringRes.serialError;
    } else {
      serialError = '';
    }
    update(['collection']);
  }

  auditValidation() {
    if (auditNumberController.text.trim() == "") {
      auditError = StringRes.machineTypeError;
    } else {
      auditError = '';
    }
    update(['collection']);
  }

  inPreValidation() {
    if (previousNumberInController.text.trim() == "") {
      inPreviousError = StringRes.previousError;
    } else {
      inPreviousError = '';
    }
    update(['collection']);
  }

  inCurValidation() {
    if (currentNumberInController.text.trim() == "") {
      inCurrentError = StringRes.currentError;
    } else {
      inCurrentError = '';
    }
    update(['collection']);
  }

  outPreValidation() {
    if (previousNumberOutController.text.trim() == "") {
      outPreviousError = StringRes.previousError;
    } else {
      outPreviousError = '';
    }
    update(['collection']);
  }

  outCurValidation() {
    if (currentNumberOutController.text.trim() == "") {
      outCurrentError = StringRes.currentError;
    } else {
      outCurrentError = '';
    }
    update(['collection']);
  }

  totalValidation() {
    if (totalController.text.trim() == "") {
      totalError = StringRes.totalError;
    } else {
      totalError = '';
    }
    update(['collection']);
  }

  val() async {
    locationValidation();
    machineValidation();
    serialValidation();
    auditValidation();
    inCurValidation();
    inPreValidation();
    outCurValidation();
    outPreValidation();
    totalValidation();
    imageValidation();
  }

  validation() {
    val();
    if (machineError == '' &&
        serialError == '' &&
        auditError == '' &&
        inCurrentError == '' &&
        inPreviousError == '' &&
        outCurrentError == '' &&
        outPreviousError == '' &&
        totalError == '' &&
        imageError == '') {
      return true;
    } else {
      return false;
    }
  }

  //
  // File? image;
  // final ImagePicker picker = ImagePicker();
  // Future<void> getImageFromCamera() async {
  //   final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  //
  //   if (photo != null) {
  //
  //       image = File(photo.path);
  //   }
  //   update(['collection']);
  // }
}
