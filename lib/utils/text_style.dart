import 'package:flutter/material.dart';

import 'color_res.dart';
import 'font_res.dart';

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
    fontWeight: FontWeight.w400,
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

TextStyle commonSubtitle() {
  return TextStyle(
    // color: ColorRes.grey2,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    // fontFamily: FontRes.black,
  );
}
