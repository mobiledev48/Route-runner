import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_res.dart';
import '../utils/strings.dart';

class Button extends StatelessWidget {
  final Function()? onpressed;
  final double height;
  final double width;
  const Button({
    super.key,
    required this.height,
    required this.width,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: ColorRes.mainColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          StringRes.login,
          style: GoogleFonts.nunito(textStyle: const TextStyle(color: ColorRes.white, fontSize: 16)),
        )),
      ),
    );
  }
}

class ForgotButton extends StatelessWidget {
  final Function()? onpressed;
  final double height;
  final double width;
  const ForgotButton({
    super.key,
    required this.height,
    required this.width,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: ColorRes.mainColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          StringRes.submit,
          style: GoogleFonts.nunito(textStyle: const TextStyle(color: ColorRes.white, fontSize: 16)),
        )),
      ),
    );
  }
}
