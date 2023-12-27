import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/screens/home_view/home_controller.dart';
import 'package:route_runner/screens/home_view/widget/appbar_container.dart';
import 'package:route_runner/screens/home_view/widget/text_feild_view.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';

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
                const Row(
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
              height: Get.height * 0.16,
              width: Get.width * 0.9,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: ColorRes.white),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text(StringRes.newCollection, style: commonTitle()),
                  ),
                  SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(width: Get.width * 0.6, height: Get.height * 0.06, child: const TextFeildView()),
                      Container(
                          height: Get.height * 0.06,
                          width: Get.width * 0.14,
                          decoration: BoxDecoration(color: ColorRes.mainColor, borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(onPressed: () {}, child: const Text(StringRes.go)))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: Get.height * 0.33,
              width: Get.width * 0.9,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: ColorRes.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: Text(
                          StringRes.recentCollection,
                          style: commonTitle(),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.36,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Image.asset(
                          AssetRes.menu,
                          scale: 3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        StringRes.serialNo,
                        style: commonSubtitle(),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        AssetRes.arrowDown,
                        color: Colors.grey,
                        scale: 3,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        StringRes.location,
                        style: commonSubtitle(),
                      ),
                      SizedBox(
                        width: 28,
                      ),
                      Image.asset(
                        AssetRes.arrowDown,
                        color: Colors.grey,
                        scale: 3,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        StringRes.current,
                        style: commonSubtitle(),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        AssetRes.arrowDown,
                        color: Colors.grey,
                        scale: 3,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        StringRes.previous,
                        style: commonSubtitle(),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        AssetRes.arrowDown,
                        color: Colors.grey,
                        scale: 3,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        StringRes.total,
                        style: commonSubtitle(),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  homeController.dividers(),
                  SizedBox(
                    height: 125,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) => Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            StringRes.num3,
                            style: commonSubtitle(),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(StringRes.moonlightBar, style: commonSubtitle()),
                          SizedBox(
                            width: 17,
                          ),
                          Text(StringRes.num4, style: commonSubtitle()),
                          SizedBox(
                            width: 25,
                          ),
                          Text(StringRes.num5, style: commonSubtitle()),
                          SizedBox(
                            width: 28,
                          ),
                          Text(StringRes.num6, style: commonSubtitle()),
                        ],
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              height: Get.height * 0.3,
              width: Get.width * 0.9,
              decoration: BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          StringRes.pendingRepairs,
                          style: commonTitle(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 160, top: 20),
                        child: Image.asset(
                          AssetRes.menu,
                          scale: 3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Serial No: #1-876364',
                            style: commonSubtitle().copyWith(fontSize: 12),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Text(
                            'Reporter: Steven',
                            style: commonSubtitle().copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Location: Moonlight Bar',
                            style: commonSubtitle().copyWith(fontSize: 12),
                          ),
                          SizedBox(
                            width: 55,
                          ),
                          Text(
                            'Date: 15 Dec, 2023',
                            style: commonSubtitle().copyWith(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Issue: Joy stick not working',
                        style: commonSubtitle().copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        'Time: 11:06 AM',
                        style: commonSubtitle().copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  homeController.dividers(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
