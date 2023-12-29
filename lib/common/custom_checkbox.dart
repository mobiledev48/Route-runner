import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/admin_view/admin_controller.dart';
import '../utils/color_res.dart';
import '../utils/strings.dart';
import '../utils/text_style.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox({super.key});
  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            onTap: () {
              adminController.clickableContainer();
            },
            child: adminController.isClick
                ? Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorRes.mainColor),
                        color: ColorRes.mainColor,
                        borderRadius: const BorderRadius.all(Radius.circular(3))),
                    child: Icon(
                      size: 14,
                      Icons.check,
                      color: Colors.white,
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
}
