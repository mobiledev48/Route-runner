import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/common/button.dart';
import 'package:route_runner/common/common_text_fild.dart';
import 'package:route_runner/screens/reset_password/reset_password_controller.dart';
import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/strings.dart';
import 'package:route_runner/utils/text_style.dart';

class ResetScreen extends StatelessWidget {
   ResetScreen({Key? key,required this.employeeId}) : super(key: key);
   final String employeeId;
ResetPasswordController resetPasswordController = Get.put(ResetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,

        children: [
          GetBuilder<ResetPasswordController>(
              id: "reset-pass",
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: Get.width * 0.04,
                    left: Get.width * 0.04,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: ColorRes.themeColor,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Image.asset(
                            AssetRes.splashLogo,
                            color: ColorRes.mainColor,
                            scale: 5,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(StringRes.resetPass, style: logoStyle()),
                        ),

                        SizedBox(
                          height: Get.height * 0.05,
                        ),

                        /// ----- text field --------

                        CommonTextField(
                          containerHeight: Get.height * 0.07,
                          titleText: StringRes.password,
                          controller: controller.passwordController,
                          // color: ColorRes.tffGrey2,
                          color: Colors.grey.shade100,
                          hintText: 'Enter  password',
                        ),
                        (controller.passwordError != "")
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Text(controller.passwordError,
                                      style: commonSubtitle()
                                          .copyWith(color: ColorRes.red)),
                                ),
                              )
                            : const SizedBox(),

                        SizedBox(height: Get.height * 0.05),


                        CommonTextField(
                          containerHeight: Get.height * 0.07,
                          titleText: "Confirm password",
                          controller: controller.conPasswordController,
                          // color: ColorRes.tffGrey2,
                          color: Colors.grey.shade100,
                          hintText: 'Enter confirm password',
                        ),
                        (controller.conPasswordError != "")
                            ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(controller.conPasswordError,
                                style: commonSubtitle()
                                    .copyWith(color: ColorRes.red)),
                          ),
                        )
                            : const SizedBox(),

                        SizedBox(height: Get.height * 0.05),

                        /// ---- submit button ----

                        Center(
                          child: ForgotButton(
                            height: 50,
                            width: 321,
                            onpressed: () {
                              FocusScope.of(context).unfocus();
                              controller.validation();
                                if (controller.passwordError == '' &&
                                    controller.conPasswordError == '') {
                          controller.resetPassword(employeeId);
                                }

                                // PrefService.setValue(PrefKeys.login, true);

                            },
                          ),
                        ),

                        SizedBox(height: Get.height * 0.03),
                      ],
                    ),
                  ),
                );
              }),
          Obx(() => resetPasswordController.loader.value ?const CircularProgressIndicator() :const SizedBox()),
        ],
      ),
    );
  }
}
