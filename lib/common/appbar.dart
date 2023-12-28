import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/home_view/home_screen.dart';
import '../utils/color_res.dart';
import '../utils/strings.dart';
import '../utils/text_style.dart';

class AppBars extends StatelessWidget {
  final String title;
  const AppBars({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.13,
      width: Get.width,
      color: ColorRes.mainColor,
      padding: EdgeInsets.only(top: 30),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ColorRes.white,
                size: 20,
              )),
          SizedBox(width: Get.width * 0.26),
          Text(
            title,
            style: appbarStyle().copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
