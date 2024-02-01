// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/common/button.dart';
import 'package:route_runner/common/common_text_fild.dart';
import 'package:route_runner/screens/Forgot_password/forgotPasswordController.dart';
import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/strings.dart';
import 'package:route_runner/utils/text_style.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<ForgotPasswordController>(
              id: "reset",
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
                          height: 10,
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
                          child: Text(StringRes.forgotPass, style: logoStyle()),
                        ),

                        SizedBox(
                          height: Get.height * 0.05,
                        ),

                        /// ----- text field --------

                        CommonTextField(
                          containerHeight: Get.height * 0.07,
                          titleText: StringRes.emailAddress,
                          controller: controller.emailController,
                          // color: ColorRes.tffGrey2,
                          color: Colors.grey.shade100,
                          hintText: StringRes.exampleEmail,
                        ),
                        (controller.emailError != "")
                            ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(controller.emailError.tr, style: commonSubtitle().copyWith(color: ColorRes.red)),
                          ),
                        )
                            : const SizedBox(),

                        SizedBox(height: Get.height * 0.05),

                        /// ---- submit button ----

                        ForgotButton(
                          height: 50,
                          width: 321,
                          onpressed: () {
                            FocusScope.of(context).unfocus();
                            if (controller.validation()) {

                              controller.onTapSubmit();
                              // PrefService.setValue(PrefKeys.login, true);
                            }
                          },
                        ),

                        SizedBox(height: Get.height * 0.03),


                      ],
                    ),
                  ),
                );
              })),
    );
  }

}
