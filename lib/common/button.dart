import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/dash_board/dash_board_screen.dart';
import '../utils/color_res.dart';
import '../utils/strings.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final double width;
  const Button({super.key, required this.onPressed, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: ColorRes.mainColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(StringRes.login, style: GoogleFonts.nunito(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}
