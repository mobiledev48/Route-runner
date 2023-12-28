import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_res.dart';
import '../../../utils/font_res.dart';
import '../../../utils/text_style.dart';
import '../admin_controller.dart';

class TextFormFields extends StatelessWidget {
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
  final bool? enable;
  TextFormFields({
    super.key,
    required this.texts,
    required this.con,
    this.prefix,
    required this.isprefix,
    this.sufix,
    required this.issufix,
    this.isclick,
    this.type,
    this.onChange,
    this.vadidation,
    this.enable,
    // required this.icon
  });

  final ValueNotifier _visiblePassword = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _visiblePassword,
      builder: (context, value, child) => TextFormField(
        enabled: enable,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: vadidation,
        onChanged: onChange,
        keyboardType: type,
        obscureText: value,
        controller: con,
        style: TextStyle(fontSize: 15, fontFamily: 'FontsFree', color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
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
                  icon: value ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined))
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
          hintText: texts,
          // hintStyle: textStyle().textform,
          filled: true,
          fillColor: Colors.grey.shade200,
          focusColor: Colors.black12,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff6f6f6)),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff6f6f6)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
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
        // autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  icon: value ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined))
              : null,
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
          hintText: texts,
          // hintStyle: textStyle().textform,
          filled: true,
          fillColor: Colors.grey.shade200,
          focusColor: Colors.black12,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff6f6f6)),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff6f6f6)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

// class CustomFeildView extends StatelessWidget {
//   final String? label;
//   final String hint;
//   final TextEditingController controller;
//   final Widget? sufix;
//   final bool isSufix;
//   const CustomFeildView(
//       {super.key, this.label, required this.hint, required this.controller, required this.isSufix, this.sufix});
//
//   @override
//   Widget build(BuildContext context) {
//     AdminController adminController = Get.put(AdminController());
//
//     final ValueNotifier _visiblePassword = ValueNotifier<bool>(false);
//
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.topLeft,
//           child: Text(label!, style: hintTextStyle()),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         ValueListenableBuilder(
//           valueListenable: _visiblePassword,
//           builder: (context, value, child) {
//             return TextFormField(
//               controller: controller,
//               style: GoogleFonts.glory(fontSize: 15),
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
//                 hintText: hint,
//                 hintStyle: TextStyle(
//                   color: ColorRes.darkBlue,
//                   fontWeight: FontWeight.w300,
//                   fontSize: 14,
//                   fontFamily: FontRes.black,
//                 ),
//                 suffixIcon: isSufix
//                     ? IconButton(
//                         color: ColorRes.black,
//                         iconSize: 18,
//                         onPressed: () => _visiblePassword.value = !_visiblePassword.value,
//                         icon: value ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined))
//                     : null,
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//                 focusColor: Colors.black12,
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xfff6f6f6)),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xfff6f6f6)),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               // validator: (value) {
//               //   if (value == null || value.isEmpty) {
//               //     return 'Please enter your username';
//               //   }
//               //   return null;
//               // },
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class passwordFeild extends StatelessWidget {
//   const passwordFeild({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     AdminController adminController = Get.put(AdminController());
//     bool _obscurePassword = true;
//     return TextFormField(
//       controller: adminController.passwordController,
//       style: GoogleFonts.glory(fontSize: 15),
//       decoration: InputDecoration(
//           suffixIcon: IconButton(
//             icon: Icon(
//               _obscurePassword ? Icons.visibility : Icons.visibility_off,
//             ),
//             onPressed: () {
//               // setState(() {
//               _obscurePassword = !_obscurePassword;
//               // });
//             },
//           ),
//           filled: true,
//           fillColor: Colors.grey.shade100,
//           focusColor: Colors.black12,
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xfff6f6f6)),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xfff6f6f6)),
//             borderRadius: BorderRadius.circular(10),
//           )),
//       obscureText: adminController.obText.isTrue ? true : false,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your password';
//         }
//         return null;
//       },
//     );
//   }
// }
