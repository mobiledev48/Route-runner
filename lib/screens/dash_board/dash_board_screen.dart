import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/screens/dash_board/dash_board_controller.dart';

import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      id: 'dash',
      builder: (controller) {
        return Scaffold(
          body: dashBoardController.screen.elementAt(dashBoardController.currentIndex),
          bottomNavigationBar: Container(
            height: Get.height * 0.1,
            child: BottomAppBar(
              color: ColorRes.white,
              child: Expanded(
                  child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            dashBoardController.nextPage(0);
                            dashBoardController.update(['dash']);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                AssetRes.home,
                                scale: 3,
                                color: dashBoardController.currentIndex == 0 ? ColorRes.mainColor : Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Text(
                                StringRes.home,
                                style: TextStyle(
                                    color: dashBoardController.currentIndex == 0 ? ColorRes.mainColor : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            dashBoardController.nextPage(1);
                            dashBoardController.update(['dash']);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                AssetRes.location,
                                scale: 3,
                                color: dashBoardController.currentIndex == 1 ? ColorRes.mainColor : Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Text(
                                StringRes.location,
                                style: TextStyle(
                                    color: dashBoardController.currentIndex == 1 ? ColorRes.mainColor : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            dashBoardController.nextPage(2);
                            dashBoardController.update(['dash']);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                AssetRes.machine,
                                scale: 3,
                                color: dashBoardController.currentIndex == 2 ? ColorRes.mainColor : Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Text(
                                StringRes.machine,
                                style: TextStyle(
                                    color: dashBoardController.currentIndex == 2 ? ColorRes.mainColor : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       dashBoardController.nextPage(3);
                      //       dashBoardController.update(['dash']);
                      //     },
                      //     child: Column(
                      //       children: [
                      //         Image.asset(
                      //           AssetRes.employee,
                      //           scale: 3,
                      //           color: dashBoardController.currentIndex == 3 ? ColorRes.mainColor : Colors.grey,
                      //         ),
                      //         SizedBox(height: 10),
                      //         Text(
                      //           StringRes.employee,
                      //           style: TextStyle(
                      //               color: dashBoardController.currentIndex == 3 ? ColorRes.mainColor : Colors.grey),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            dashBoardController.nextPage(3);
                            dashBoardController.update(['dash']);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                AssetRes.profile,
                                scale: 3,
                                color: dashBoardController.currentIndex == 3 ? ColorRes.mainColor : Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Text(
                                StringRes.profile,
                                style: TextStyle(
                                    color: dashBoardController.currentIndex == 3 ? ColorRes.mainColor : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              )),
            ),
          ),
        );
      },
    );
  }
}
