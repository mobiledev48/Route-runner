import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/home_view/home_screen.dart';
import '../utils/color_res.dart';

class AppBars extends StatelessWidget {
  final String title;
  const AppBars({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.to(HomeScreen());
          },
          icon: Icon(Icons.arrow_back_ios_sharp)),
      centerTitle: true,
      backgroundColor: ColorRes.mainColor,
      title: Text(
        title,
        style: GoogleFonts.glory(fontSize: 25),
      ),
      // automaticallyImplyLeading: false,
    );
  }
}
