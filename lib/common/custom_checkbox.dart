import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    child: Icon(
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
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  )),
        SizedBox(
          width: Get.width * 0.02,
        ),
        Text(
          StringRes.rememberMe,
          style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 14)),
        ),
        SizedBox(
          width: Get.width * 0.18,
        ),
        Text(
          StringRes.resetPassword,
          style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 14, color: ColorRes.mainColor)),
        ),
      ],
    );
  }
}
