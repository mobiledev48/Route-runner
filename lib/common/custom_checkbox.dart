import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/Forgot_password/ForgotPasswordScreen.dart';

import '../screens/admin_view/admin_controller.dart';
import '../utils/color_res.dart';
import '../utils/strings.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox({super.key});
  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              adminController.clickableContainer();
            },
            child: adminController.isClick
                ? Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorRes.mainColor),
                        color: ColorRes.mainColor,
                        borderRadius: const BorderRadius.all(Radius.circular(5))),
                    child: const Icon(
                      size: 14,
                      Icons.check,
                      color: Colors.white,
                    ),
                  )
                : Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.all(Radius.circular(5))),
                  )),
        SizedBox(
          width: Get.width * 0.02,
        ),
        Expanded(
          child: Text(
            StringRes.rememberMe,
            style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 14)),
          ),
        ),
        SizedBox(
          width: Get.width * 0.1,
        ),
        Expanded(
          child: InkWell(
            onTap: (){
              Get.to(ForgotPasswordScreen());
            },
            child: Text(
              StringRes.resetPassword,
              style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 14, color: ColorRes.mainColor)),
            ),
          ),
        ),
      ],
    );
  }
}
