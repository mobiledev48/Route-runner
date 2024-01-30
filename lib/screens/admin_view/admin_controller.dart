
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/auth/signIn_api/sign_in_api.dart';
import 'package:route_runner/api_call/auth/signIn_api/sign_in_model.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/pref_keys.dart';
import '../../common/common_text_fild.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';
import '../dash_board/dash_board_screen.dart';

class AdminController extends GetxController {
  TextEditingController  emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Rx<TextEditingController> email = TextEditingController(text: "user12@gmail.com").obs;
  // Rx<TextEditingController> passwordC = TextEditingController(text: "user123").obs;
  // RxBool loader = false.obs;
  // RxBool obText = false.obs;
  bool isClick = false;
  String emailError = "";
  String passwordError = "";
  SignInModel signInModel = SignInModel();
  RxBool isLoading = false.obs;


 Future<bool> signInApi({email,password})
  async {
    isLoading.value = true;
    signInModel =  await CustomerSignInApi.customerSignInApi(email: email,password: password);
    Get.to(() => DashBoardScreen());

   // PrefService.setValue(PrefKeys.registerToken, signInModel.token);
    print("===================================-----------------========${PrefService.setValue(PrefKeys.registerToken, signInModel.token)}");

    isLoading.value = false;
    return  isLoading.value;
  }


  emailValidation() {
    update(['logIn']);
    if (emailController.text.trim() == "") {
      // errorToast(StringRes.enterEmailError.tr);
      emailError = StringRes.enterEmailError.tr;
      update(['logIn']);
      return false;
    } else {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        emailError = '';
        update(['logIn']);
        return true;
      } else {
        // errorToast(StringRes.enterValidEmail.tr);
        emailError = StringRes.enterValidEmail.tr;
        update(['logIn']);
        return false;
      }
    }
  }

  passwordValidation() {
    if (passwordController.text.trim() == "") {
      // errorToast(StringRes.enterPasswordError.tr);
      passwordError = StringRes.enterPasswordError.tr;
      update(['logIn']);
      return false;
    } else {
      if (passwordController.text.trim().length >= 1) {
        passwordError = '';
        update(['logIn']);
        return true;
      } else {
        // errorToast(StringRes.passwordMustBe.tr);
        passwordError = StringRes.passwordMustBe.tr;
        update(['logIn']);
        return false;
      }
    }
  }

  val() async {
    emailValidation();
    passwordValidation();
  }

  validator() {
    val();

    if (emailError == '' && passwordError == '') {
      return true;
    } else {
      return false;
    }
  }

  // @override
  // void onClose() {
  //   // Dispose of the TextEditingController when the controller is closed
  //   email.value.dispose();
  //   passwordC.value.dispose();
  //   super.onClose();
  // }

  // void onTapOb() {
  //   if (obText.isTrue) {
  //     obText.value = false;
  //   } else {
  //     obText.value = true;
  //   }
  // }

  //_______________________________ login On Tap _________________

  // Future<void> loginOnTap(BuildContext context) async {
  //   FocusScope.of(context).unfocus();
  //   if (formKey.currentState?.validate() == true) {
  //     if (isEmailValid(emailController.value.text)) {
  //       // await loginApi(context);
  //
  //       // await loginApi(context);
  //     } else {
  //       errorToast('please Enter Valid Email', text: "Error");
  //     }
  //   } else {
  //     errorToast('Please enter email or password', text: "Error");
  //   }
  // }

  void clickableContainer() {
    isClick = !isClick;
    update(['admin']);
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

  Widget formView() {
    return Column(
      children: [
        const SizedBox(height: 80),
        CommonTextField(
          containerHeight: Get.height * 0.07,
          titleText: StringRes.emailAddress,
          controller: emailController,
          // color: ColorRes.tffGrey2,
          color: Colors.grey.shade100,
          hintText: StringRes.exampleEmail,
        ),
        (emailError != "")
            ? Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(emailError.tr, style: commonSubtitle().copyWith(color: ColorRes.red)),
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 27,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            StringRes.password,
            style: hintTextStyle().copyWith(fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        PasswordField(
          texts: StringRes.dots,
          con: passwordController,
          isprefix: false,
          issufix: true,
        ),
        (passwordError != "")
            ? Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(passwordError, style: commonSubtitle().copyWith(color: ColorRes.red)),
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 27,
        ),
      ],
    );
  }
}
