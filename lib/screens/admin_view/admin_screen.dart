import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/screens/admin_view/admin_controller.dart';
import 'package:route_runner/screens/admin_view/widget/customFeildView.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../common/button.dart';
import '../../common/custom_checkbox.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/font_res.dart';
import '../../utils/strings.dart';
import '../dash_board/dash_board_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AdminController adminController = Get.put(AdminController());
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: GetBuilder<AdminController>(
              id: 'admin',
              builder: (controller) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Image.asset(
                        AssetRes.splashLogo,
                        color: ColorRes.mainColor,
                        scale: 4,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        StringRes.RRlogin,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: FontRes.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(StringRes.emailAddress, style: hintTextStyle()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: Get.height * 0.09,
                      child: TextFormFields(
                          texts: StringRes.exampleEmail,
                          con: adminController.emailController,
                          isprefix: false,
                          issufix: false),
                    ),
                    (adminController.emailError != "")
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(adminController.emailError.tr,
                                  style: commonSubtitle().copyWith(color: ColorRes.red)),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        StringRes.password,
                        style: hintTextStyle(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: Get.height * 0.09,
                      child: PasswordField(
                        texts: StringRes.dots,
                        con: adminController.passwordController,
                        isprefix: false,
                        issufix: true,
                      ),
                    ),
                    (adminController.passwordError != "")
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(adminController.passwordError.tr,
                                  style: commonSubtitle().copyWith(color: ColorRes.red)),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    CustomCheckbox(),
                    SizedBox(
                      height: 20,
                    ),
                    Button(
                      height: Get.height * 0.08,
                      width: Get.width * 0.9,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (adminController.validator()) {
                          Get.to(() => DashBoardScreen());
                        }
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
