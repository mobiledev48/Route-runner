import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/common/pop_up.dart';
import 'package:route_runner/screens/location_view/location_screen.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:http/http.dart' as http;
import 'package:route_runner/utils/pref_keys.dart';

import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';

class AdminController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Rx<TextEditingController> email = TextEditingController(text: "user12@gmail.com").obs;
  // Rx<TextEditingController> passwordC = TextEditingController(text: "user123").obs;
  RxBool loader = false.obs;
  RxBool obText = false.obs;
  bool isClick = false;
  bool _obscurePassword = true;

  // @override
  // void onClose() {
  //   // Dispose of the TextEditingController when the controller is closed
  //   email.value.dispose();
  //   passwordC.value.dispose();
  //   super.onClose();
  // }

  void onTapOb() {
    if (obText.isTrue) {
      obText.value = false;
    } else {
      obText.value = true;
    }
  }

  //_______________________________ validation Email _________________

  bool isEmailValid(String email) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return regex.hasMatch(email);
  }

  //_______________________________ login On Tap _________________

  Future<void> loginOnTap(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState?.validate() == true) {
      if (isEmailValid(emailController.value.text)) {
        // await loginApi(context);

        // await loginApi(context);
      } else {
        errorToast('please Enter Valid Email', text: "Error");
      }
    } else {
      errorToast('Please enter email or password', text: "Error");
    }
  }

  void clickableContainer() {
    isClick = !isClick;
    update(['admin']);
  }

  Widget customContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            onTap: () {
              clickableContainer();
            },
            child: isClick
                ? Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.all(Radius.circular(3))),
                    child: Icon(
                      size: 14,
                      Icons.check,
                      color: Colors.black,
                    ),
                  )
                : Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                  )),
        SizedBox(width: 4),
        Text(
          "Remember me",
          style: hintTextStyle(),
        ),
        SizedBox(width: Get.width * 0.1),
        TextButton(
            onPressed: () {},
            child: Text(
              StringRes.resetPassword,
              style: hintTextStyle().copyWith(color: ColorRes.mainColor),
            ))
      ],
    );
  }

  /* loginApi(BuildContext context) async {
    loader.value = true;
    try {
      Map<String, String> param = {
        "email": email.value.text,
        "password": passwordC.value.text
      };

      http.Response? response = await HttpService.postApi(
          url: "http://192.168.29.98:5050/api/user/login",
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
          });
      if (response != null && response.statusCode == 200) {
        flutterToast('Login Success');
        Get.to(const LocationScreen());
        loader.value = false;
        return loginModelFromJson(response.body);
      } else {
        loader.value = false;
        errorToast('Please Check Your Email or Password', text: "Error");
      }
    } catch (e) {
      loader.value = false;
      return [];
    }
  }*/
  // loginApi(BuildContext context) async {
  //   loader.value = true;
  //   var headers = {
  //     'Content-Type': 'application/json',
  //   };
  //   var request = http.Request('POST', Uri.parse('http://192.168.29.98:5050/api/user/login'));
  //   request.body = json.encode({"email": email.value.text, "password": passwordC.value.text});
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     flutterToast('Login Success');
  //     Get.to(const LocationScreen());
  //     loader.value = false;
  //     String responseBody = await response.stream.bytesToString();
  //     debugPrint(responseBody);
  //
  //     Map<String, dynamic> jsonData = json.decode(responseBody);
  //     await PrefService.setValue(PrefKeys.loginId, jsonData['_id']);
  //     await PrefService.setValue(PrefKeys.registerToken, jsonData['token']);
  //     loader.value = false;
  //
  //     Get.to(const LocationScreen());
  //   } else {
  //     loader.value = false;
  //
  //     debugPrint(response.reasonPhrase);
  //   }
  //   loader.value = false;
  // }
}
