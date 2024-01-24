import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/button.dart';
import 'package:route_runner/utils/color_res.dart';

import '../api_call/get_location_api/get_location_model.dart';

class MyDialog extends StatelessWidget {
  final List<Machines>? machines;

  MyDialog({this.machines});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Container(
          height: 50,
          alignment: Alignment.centerLeft,
          color: ColorRes.mainColor,
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: Get.width,
          child:  Text("List of Machine" , style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),),
        ),
        SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (machines != null)
                ListView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: machines!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          'Machine Number: ${machines![index].machineNumber}'),
                      subtitle: Text(
                          'Serial Number: ${machines![index].serialNumber}'),
                    );
                  },
                ),
            ],
          ),
        ),
        Center(
          child: Button(
            onpressed: () {
              Get.back();
            },
            height: 40,
            width: 150,
            title: "Cancel",
          ),
        ),
        SizedBox(height: Get.height * 0.05,),
      ],
    );
  }
}

void showMyDialog(BuildContext context, machines) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return MyDialog(
        machines: machines,
      );
    },
  );
}
