import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/admin_view/admin_controller.dart';
import 'package:route_runner/screens/admin_view/widget/customFeildView.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/font_res.dart';
import '../../utils/strings.dart';
import '../dash_board/dash_board_screen.dart';
import '../edit_location_view/edit_location_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AdminController adminController = Get.put(AdminController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: GetBuilder<AdminController>(
              id: 'admin',
              builder: (controller) {
                return Form(
                  key: adminController.formKey,
                  child: Column(
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
                      TextFormFields(
                          vadidation: (value) {
                            bool emailvalid =
                                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`  {|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!);
                            if (value!.isEmpty) {
                              return 'Enter the Email';
                            } else if (!emailvalid) {
                              return "Enter Valid email";
                            }
                            return null;
                          },
                          texts: StringRes.exampleEmail,
                          con: adminController.emailController,
                          isprefix: false,
                          issufix: false),
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
                      PasswordField(
                        vadidation: (value) {
                          if (value!.isEmpty) {
                            return 'Enter the Password';
                          } else {
                            return null;
                          }
                        },
                        texts: StringRes.password,
                        con: adminController.passwordController,
                        isprefix: false,
                        issufix: true,
                      ),
                      adminController.customContainer(),
                      Align(
                        heightFactor: 2,
                        child: Container(
                            height: Get.height * 0.08,
                            width: Get.width * 0.9,
                            decoration:
                                BoxDecoration(color: ColorRes.mainColor, borderRadius: BorderRadius.circular(10)),
                            child: CupertinoButton(
                                child: Text(
                                  StringRes.login,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (adminController.formKey.currentState!.validate()) {
                                    Get.to(() => DashBoardScreen());
                                  }
                                  // adminController.loginOnTap(context);
                                })),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Text(
      //     'Admin Login',
      //     style: GoogleFonts.glory(fontSize: 25),
      //   ),
      // ),
      // body: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Obx(() => Stack(
      //           children: [
      //             textFiledView(adminController, context),
      //             // adminController.loader.isTrue
      //             //     ? const Center(
      //             //         child: CircularProgressIndicator(),
      //             //       )
      //             //     : const SizedBox()
      //           ],
      //         ))),
    );
  }

  Widget textFiledView(AdminController adminController, BuildContext context) {
    bool _obscurePassword = true;

    return Form(
      key: adminController.formKey,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(StringRes.emailAddress, style: hintTextStyle()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: adminController.emailController,
            style: GoogleFonts.glory(fontSize: 15),
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
              hintText: StringRes.exampleEmail,
              hintStyle: TextStyle(
                color: ColorRes.red,
                fontWeight: FontWeight.w300,
                fontSize: 14,
                fontFamily: FontRes.black,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              focusColor: Colors.black12,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff6f6f6)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff6f6f6)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 30.0),
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
          TextFormField(
            controller: adminController.passwordController,
            style: GoogleFonts.glory(fontSize: 15),
            decoration: InputDecoration(
                hintText: '',
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
                fillColor: Colors.grey.shade100,
                focusColor: Colors.black12,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff6f6f6)),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff6f6f6)),
                  borderRadius: BorderRadius.circular(10),
                )),
            obscureText: adminController.obText.isTrue ? true : false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          // const SizedBox(height: 24.0),
          // SizedBox(
          //   height: 40,
          //   width: 100,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.black.withOpacity(0.5), // Set the background color here
          //     ),
          //     onPressed: () {
          //       adminController.loginOnTap(context);
          //     },
          //     child: Text(
          //       'Login',
          //       style: GoogleFonts.glory(fontSize: 15),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
