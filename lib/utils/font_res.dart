import 'package:flutter/cupertino.dart';

class FontRes {
  static const black = "Nunito-Black";
  static const blackItalic = "Nunito-BlackItalic.ttf";
  static const bold = "Nunito-Bold.ttf";
  static const boldItalic = "Nunito-BoldItalic.ttf";
  static const extraBold = "Nunito-ExtraBold.ttf";
  static const extraBoldItalic = "Nunito-ExtraBoldItalic.ttf";

  //---------------old----------------
  static const gilroyBold = "Gilroy-Bold";
  static const gilroySemiBold = "Gilroy-SemiBold";
  static const gilroyMedium = "Gilroy-Medium";
  static const gilroyRegular = "Gilroy-Regular";
  static const beVietnamProBold = "BeVietnamPro-Bold";
  static const beVietnamProSemiBold = "BeVietnamPro-SemiBold";
  static const beVietnamProMedium = "BeVietnamPro-Medium";
  static const beVietnamProRegular = "BeVietnamPro-Regular";
  static const montserratRegular = "Montserrat-Regular";
  static const sFProText = "SF-Pro-Text";
  static const inter = "Inter.ttf";

  static const poppinsSemiBold = "Poppins-SemiBold";
  static const poppinsMedium = "Poppins-Medium";
  static const poppinsRegular = "Poppins-Regular";
}

Widget sizeH({double? h}) {
  return SizedBox(
    height: h ?? 15,
  );
}
//
// Widget sizeW({double? w}) {
//   return SizedBox(
//     height: w ?? 15,
//   );
// }
