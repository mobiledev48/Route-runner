import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/utils/color_res.dart';

import '../utils/asset_res.dart';
import '../utils/strings.dart';

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
  final GestureTapCallback? suffixIconOnTap;

// <<<<<<< HEAD
//   CommonTextField({this.hintText, this.isRequired, this.titleText, this.controller, this.readOnly});
// =======
  CommonTextField(
      {this.maxLines,
      this.containerHeight,
      this.hintText,
      this.isRequired,
      this.suffixIconOnTap,
      this.suffixIconSize,
      this.isSuffixIcon,
      this.suffixIcon,
      this.titleText,
      this.controller,
      this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(titleText ?? "",
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorRes.color030229,
                )),
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
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: ColorRes.colorF7F7F8),
          child: TextField(
            maxLines: maxLines ?? 1,
            controller: controller,
            readOnly: readOnly ?? false,
            decoration: InputDecoration(
                hintText: hintText ?? "",
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                suffixIcon: isSuffixIcon == true
                    ? GestureDetector(
                        onTap: suffixIconOnTap,
                        child: Image.asset(
                          suffixIcon ?? "",
                          scale: suffixIconSize ?? 0.0,
                        ))
                    : SizedBox()),
          ),
        ),
      ],
    );
  }
}

class CommomTextFormFeild extends StatelessWidget {

  final TextEditingController? controller;
  ValueChanged<String>? onChanged;
  // const CommomTextFormFeild({super.key});
   CommomTextFormFeild({this.controller,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        suffixIcon: Image.asset(
          AssetRes.search,
          scale: 2,
        ),
        hintText: StringRes.search,
        filled: true,
        fillColor: Colors.grey.shade100,
        focusColor: Colors.black12,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff6f6f6)),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff6f6f6)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
