import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_res.dart';
import 'font_res.dart';

TextStyle logoStyle() {
  return GoogleFonts.nunito(
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      fontFamily: FontRes.black,
    ),
  );
}

TextStyle hintTextStyle() {
  return TextStyle(
    color: ColorRes.darkBlue,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
}

TextStyle appbarStyle() {
  return TextStyle(
    color: ColorRes.white,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
}

TextStyle commonTitle() {
  return TextStyle(
    color: ColorRes.grey2,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
}

TextStyle title() {
  return GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w700, color: ColorRes.black);
}

TextStyle commonSubtitle() {
  return TextStyle(
    // color: ColorRes.grey2,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    // fontFamily: FontRes.black,
  );
}

TextStyle subTitle() {
  return GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w500, color: ColorRes.grey);
}

TextStyle subTitleUnderline() {
  return GoogleFonts.nunito(
    fontWeight: FontWeight.w400,
    color: ColorRes.darkBlue,
    fontSize: 8,
    decoration: TextDecoration.underline,
  );
}
