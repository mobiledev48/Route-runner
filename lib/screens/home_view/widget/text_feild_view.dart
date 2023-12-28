import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/strings.dart';

class TextFeildView extends StatelessWidget {
  const TextFeildView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: StringRes.auditNumber,
        hintStyle: TextStyle(fontSize: 13),
        filled: true,
        fillColor: Colors.grey.shade100,
        focusColor: Colors.black12,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff6f6f6)),
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff6f6f6)),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
