import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/utils/color_res.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  bool? readOnly;
  bool? isRequired;
  String? titleText;
  String? hintText;

  CommonTextField({this.hintText,this.isRequired,this.titleText,this.controller, this.readOnly});

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
            isRequired==true?
            const Text(
              ' *',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ):SizedBox(),
          ],
        ),
        const SizedBox(
          height: 9,
        ),
        Container(
          height: 58,
          width: Get.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: ColorRes.colorF7F7F8),
          child: TextField(
            controller: controller,
            readOnly: readOnly ?? false,
            decoration:  InputDecoration(
              hintText: hintText ?? "",
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder:  const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
