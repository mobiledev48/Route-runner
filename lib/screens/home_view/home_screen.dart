import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/screens/home_view/home_controller.dart';
import 'package:route_runner/screens/home_view/widget/appbar_container.dart';

import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';
import '../admin_view/widget/customFeildView.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height * 0.26,
                  width: Get.width,
                  decoration: BoxDecoration(color: ColorRes.mainColor),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Image.asset(
                        AssetRes.splashLogo,
                        scale: 11,
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Text(
                        StringRes.routeRunner,
                        style: appbarStyle(),
                      ),
                      SizedBox(
                        width: Get.width * 0.32,
                      ),
                      Image.asset(
                        AssetRes.locator,
                        scale: 3,
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Image.asset(
                        AssetRes.drawer,
                        scale: 3,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    AppbarContainer(
                      bgColor: ColorRes.lightBlue,
                      iconColor: ColorRes.mainColor,
                      image: AssetRes.location,
                      number: StringRes.num1,
                      text: StringRes.locations,
                    ),
                    AppbarContainer(
                      bgColor: ColorRes.lightYellow,
                      iconColor: ColorRes.yellow,
                      image: AssetRes.machine,
                      number: StringRes.num2,
                      text: StringRes.machines,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              height: Get.height * 0.1,
              width: Get.width * 0.9,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: ColorRes.lightYellow),
              child: Column(
                children: [
                  Text(StringRes.newCollection, style: commonTitle()),
                  Row(
                    children: [
                      CustomFeildView(
                        hint: StringRes.auditNumber,
                        controller: homeController.auditController,
                        isSufix: false,
                      )
                      // TextFormField(
                      //   decoration: InputDecoration(hintText: StringRes.auditNumber),
                      // )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
