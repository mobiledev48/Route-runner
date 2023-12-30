import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/common_text_fild.dart';
import 'package:route_runner/screens/profile_view/profile_controller.dart';
import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/strings.dart';

import '../dash_board/dash_board_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                Container(
                  height: Get.height * 0.35,
                  width: Get.width,
                  decoration: BoxDecoration(color: ColorRes.mainColor),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.08),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            GestureDetector(
                              onTap: () {
                                DashBoardController dashBoardController = Get.put(DashBoardController());
                                dashBoardController.currentIndex = 0;
                                dashBoardController.update(['dash']);
                                profileController.update(['location']);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Text(
                              'Profile',
                              style:
                                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
                            ),
                            Text(
                              '',
                              style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    // top: 190,
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        Container(
                            height: Get.height * 0.08,
                            width: Get.width,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)))),
                        Container(
                          height: Get.height * 0.63,
                          width: Get.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  CommonTextField(
                                      titleText: StringRes.employeeName,
                                      controller: profileController.employeeController),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CommonTextField(
                                      titleText: StringRes.enterEmail,
                                      controller: profileController.enterEmailController),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CommonTextField(
                                      titleText: StringRes.enterMobile,
                                      controller: profileController.enterMobileController),
                                  SizedBox(
                                    height: Get.height * 0.05,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            width: 180,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1, color: ColorRes.color5B93FF),
                                                borderRadius: BorderRadius.all(Radius.circular(10))),
                                            child: Text(
                                              StringRes.close,
                                              style: GoogleFonts.nunito(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorRes.color5B93FF),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            width: 180,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: ColorRes.color5B93FF,
                                                border: Border.all(width: 1, color: ColorRes.color5B93FF),
                                                borderRadius: BorderRadius.all(Radius.circular(10))),
                                            child: Text(
                                              StringRes.save,
                                              style: GoogleFonts.nunito(
                                                  fontSize: 14, fontWeight: FontWeight.w400, color: ColorRes.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.16),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                            height: 150,
                            width: 150,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                image: DecorationImage(image: AssetImage(AssetRes.profilePhoto)))),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(color: Colors.white, spreadRadius: 4),
                              ], shape: BoxShape.circle, color: ColorRes.mainColor),
                              child: Image.asset(
                                AssetRes.camera,
                                scale: 4,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 300,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
