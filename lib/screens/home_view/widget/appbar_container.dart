import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/asset_res.dart';
import '../../../utils/color_res.dart';
import '../../../utils/strings.dart';

class AppbarContainer extends StatelessWidget {
  final Color iconColor;
  final Color bgColor;
  final String image;
  final String number;
  final String text;
  const AppbarContainer(
      {super.key,
      required this.iconColor,
      required this.bgColor,
      required this.image,
      required this.number,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 22),
      child: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Container(
          height: Get.height * 0.1,
          width: Get.width * 0.44,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: ColorRes.white),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: Get.width * 0.03,
              ),
              CircleAvatar(
                backgroundColor: bgColor,
                radius: 26,
                child: Image.asset(
                  image,
                  color: iconColor,
                  scale: 3,
                ),
              ),
              SizedBox(
                width: Get.width * 0.04,
              ),
              Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 45),
                    child: Text(
                      number,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.004,
                  ),
                  Text(text, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
