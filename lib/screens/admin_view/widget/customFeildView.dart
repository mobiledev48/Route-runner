import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_res.dart';
import '../../../utils/font_res.dart';
import '../../../utils/text_style.dart';
import '../admin_controller.dart';

class CustomFeildView extends StatelessWidget {
  final String? label;
  final String hint;
  final TextEditingController controller;
  final Widget? sufix;
  final bool isSufix;
  const CustomFeildView(
      {super.key, this.label, required this.hint, required this.controller, required this.isSufix, this.sufix});

  @override
  Widget build(BuildContext context) {
    AdminController adminController = Get.put(AdminController());

    final ValueNotifier _visiblePassword = ValueNotifier<bool>(false);

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(label!, style: hintTextStyle()),
        ),
        const SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
          valueListenable: _visiblePassword,
          builder: (context, value, child) {
            return TextFormField(
              controller: controller,
              style: GoogleFonts.glory(fontSize: 15),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
                hintText: hint,
                hintStyle: TextStyle(
                  color: ColorRes.darkBlue,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  fontFamily: FontRes.black,
                ),
                suffixIcon: isSufix
                    ? IconButton(
                        color: ColorRes.black,
                        iconSize: 18,
                        onPressed: () => _visiblePassword.value = !_visiblePassword.value,
                        icon: value ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined))
                    : null,
                filled: true,
                fillColor: Colors.grey.shade100,
                focusColor: Colors.black12,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff6f6f6)),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff6f6f6)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter your username';
              //   }
              //   return null;
              // },
            );
          },
        ),
      ],
    );
  }
}

class passwordFeild extends StatelessWidget {
  const passwordFeild({super.key});

  @override
  Widget build(BuildContext context) {
    AdminController adminController = Get.put(AdminController());
    bool _obscurePassword = true;
    return TextFormField(
      controller: adminController.passwordController,
      style: GoogleFonts.glory(fontSize: 15),
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              // setState(() {
              _obscurePassword = !_obscurePassword;
              // });
            },
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          focusColor: Colors.black12,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff6f6f6)),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff6f6f6)),
            borderRadius: BorderRadius.circular(10),
          )),
      obscureText: adminController.obText.isTrue ? true : false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
