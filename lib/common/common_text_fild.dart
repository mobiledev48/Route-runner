import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/utils/color_res.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  bool? readOnly;
  bool? isRequired;
  bool? isSuffixIcon;
  String? titleText;
  String? hintText;
  String? suffixIcon;
  double? suffixIconSize;
  int? maxLines;
  double? containerHeight;
  double? contentPadding;
  double? borderRadius;
  final TextInputType? type;
  final GestureTapCallback? suffixIconOnTap;
  final ValueChanged<String>? onChanged;
  final Color? color;

  CommonTextField(
      {this.maxLines,
      this.containerHeight,
      this.contentPadding,
      this.borderRadius,
      this.hintText,
      this.isRequired,
      this.suffixIconOnTap,
      this.suffixIconSize,
      this.isSuffixIcon,
      this.suffixIcon,
      this.titleText,
      this.controller,
      this.readOnly,
      this.type,
      this.onChanged,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            titleText != null
                ? Text(titleText ?? "",
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorRes.color030229,
                    ))
                : SizedBox(),
            isRequired == true
                ? const Text(
                    ' *',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : SizedBox(),
          ],
        ),
        const SizedBox(
          height: 9,
        ),
        Container(
          height: containerHeight ?? 58,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              0,
            ),
          ),
          child: TextField(
              onChanged: onChanged,
              keyboardType: type,
              maxLines: maxLines ?? 1,
              controller: controller,
              readOnly: readOnly ?? false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(contentPadding ?? 10),
                  filled: true,
                  fillColor: color ?? ColorRes.white,
                  hintText: hintText ?? "",
                  hintStyle: TextStyle(fontSize: 15, color: ColorRes.grey, fontWeight: FontWeight.w400),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 15),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 15),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  suffixIcon: isSuffixIcon != null
                      ? isSuffixIcon == true
                          ? GestureDetector(
                              onTap: suffixIconOnTap,
                              child: Image.asset(
                                suffixIcon ?? "",
                                scale: suffixIconSize ?? 0.0,
                              ))
                          : SizedBox()
                      : null)),
        ),
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  final String texts;
  final TextEditingController con;
  final Widget? prefix;
  final bool isprefix;
  final Widget? sufix;
  final bool issufix;
  final bool? isclick;
  final TextInputType? type;
  final Function(String)? onChange;
  final String? Function(String?)? vadidation;
  const PasswordField(
      {Key? key,
      required this.texts,
      required this.con,
      this.prefix,
      required this.isprefix,
      this.sufix,
      required this.issufix,
      this.isclick,
      this.type,
      this.onChange,
      this.vadidation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier _visiblePassword = ValueNotifier<bool>(true);

    return ValueListenableBuilder(
      valueListenable: _visiblePassword,
      builder: (context, value, child) => TextFormField(
        validator: vadidation,
        onChanged: onChange,
        keyboardType: type,
        obscureText: value,
        controller: con,
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: isprefix
              ? IconButton(
                  iconSize: 18,
                  icon: prefix ?? SizedBox(),
                  onPressed: () {},
                )
              : null,
          suffixIcon: issufix
              ? IconButton(
                  color: ColorRes.black,
                  iconSize: 18,
                  onPressed: () => _visiblePassword.value = !_visiblePassword.value,
                  icon: value
                      ? Icon(
                          Icons.visibility_off,
                          color: ColorRes.grey,
                        )
                      : Icon(Icons.visibility_rounded, color: ColorRes.grey))
              : null,
          contentPadding: EdgeInsets.only(top: 17, left: 12),
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
          hintText: texts,
          hintStyle: TextStyle(color: ColorRes.grey),
          filled: true,
          fillColor: Colors.grey.shade100,
          focusColor: Colors.black12,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff6f6f6)),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff6f6f6)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
