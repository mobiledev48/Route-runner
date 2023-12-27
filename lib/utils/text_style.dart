import 'package:flutter/material.dart';

import 'color_res.dart';
import 'font_res.dart';

TextStyle hintTextStyle() {
  return TextStyle(
    color: ColorRes.darkBlue,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    fontFamily: FontRes.black,
  );
}

TextStyle appbarStyle() {
  return TextStyle(
    color: ColorRes.white,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    fontFamily: FontRes.black,
  );
}

TextStyle commonTitle() {
  return TextStyle(
    color: ColorRes.grey2,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    fontFamily: FontRes.black,
  );
}
