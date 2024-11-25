import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/utils/asset_res.dart';

import '../utils/color_res.dart';

customAppbar({
  required String title,
  required VoidCallback leadingOnpress,
  VoidCallback? actionOnpress,
  required bool action,
  Widget? actions,
}) {
  return AppBar(
      leading: IconButton(
          onPressed: leadingOnpress,
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            size: 20,
            color: ColorRes.white,
          )),
      centerTitle: true,
      backgroundColor: ColorRes.mainColor,
      title: Text(
        title,
        style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
      ),
      actions: [
        action == true
            ? GestureDetector(
                onTap: actionOnpress,
                child: Expanded(
                  // child: Container(
                  //   height: Get.height * 0.1,
                  //   width: Get.width * 0.07,
                  //   alignment: Alignment.center,
                  //   margin:
                  //       EdgeInsets.only(right: Get.width * 0.06, top: Get.height * 0.024, bottom: Get.height * 0.02),
                  //   decoration: BoxDecoration(
                  //       color: ColorRes.white.withOpacity(0.30),
                  //       borderRadius: const BorderRadius.all(Radius.circular(5))),
                  //   child: const Icon(
                  //     Icons.add,
                  //     size: 20,
                  //     color: ColorRes.white,
                  //   ),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Image.asset(AssetRes.addMenu,scale: 3,),
                  ),
                ),
              )
            : const SizedBox()
      ]);
}
