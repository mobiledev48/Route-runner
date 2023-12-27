import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/splash_screen/splash_controller.dart';

import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ColorRes.mainColor,
        alignment: Alignment.center,
        // decoration:
        //     const BoxDecoration(image: DecorationImage(image: AssetImage(AssetRes.splashLogo), fit: BoxFit.cover)),
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AssetRes.splashLogo,
                ),
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
