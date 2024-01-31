import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:route_runner/api_call/auth/update_profile_api/update_profile_api.dart';
import 'package:route_runner/api_call/auth/update_profile_api/update_profile_model.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/pref_keys.dart';

class ProfileController extends GetxController {
  TextEditingController employeeController = TextEditingController();
  TextEditingController employeeLastNameController = TextEditingController();
  TextEditingController enterEmailController = TextEditingController();
  TextEditingController enterMobileController = TextEditingController();

  bool isEditProfile = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    employeeController.text = PrefService.getString(PrefKeys.firstName);
    employeeLastNameController.text = PrefService.getString(PrefKeys.lastName);
    enterEmailController.text = PrefService.getString(PrefKeys.email);
    enterMobileController.text = PrefService.getInt(PrefKeys.mobileNumber).toString();
  }

  RxBool isLoading = false.obs;

  String  downloadUrl = "";
  UpdateProfileModel updateProfileModel = UpdateProfileModel();
  Future editProfileApi({required String firstName, required String lastName,required String phone,required String email})
  async {
    isLoading.value = true;

    updateProfileModel =  await CustomerUpdateProfileApi.customerUpdateProfileApi(email: email, firstName: firstName, lastName: lastName, phone: phone, image:
    (downloadUrl !='')?downloadUrl:PrefService.getString(PrefKeys.userImage));
    PrefService.setValue(PrefKeys.firstName, updateProfileModel.updatedFields?.firstname ?? "");
    PrefService.setValue(PrefKeys.lastName, updateProfileModel.updatedFields?.lastname ?? "");
    PrefService.setValue(PrefKeys.email, updateProfileModel.updatedFields?.email ?? "");
    PrefService.setValue(PrefKeys.mobileNumber, updateProfileModel.updatedFields?.phone ?? "");
    PrefService.setValue(PrefKeys.userImage, updateProfileModel.updatedFields?.image?[0] ?? "");

    isLoading.value = false;
  }

  File? image;
  final ImagePicker picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<void> getImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      image = File(photo.path);
      isLoading.value =true;
      if(image != null)
        {
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();

          Reference storageReference = _storage.ref().child('images/$fileName');

          UploadTask uploadTask = storageReference.putFile(image!);

          TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

           downloadUrl = await taskSnapshot.ref.getDownloadURL();
           print("downloadUrl ---------->$downloadUrl");
        }

      isLoading.value =false;

    //  String imageUrl = await uploadImage(image);
  //    print('Image URL: $imageUrl');
    }
    update(['profile']);
  }
}
