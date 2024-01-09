import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/admin_view/admin_screen.dart';
import 'package:route_runner/screens/collection_report/collection_report.dart';
import 'package:route_runner/screens/home_view/home_controller.dart';
import 'package:route_runner/screens/home_view/widget/appbar_container.dart';
import 'package:route_runner/screens/repair/repair_screen.dart';
import 'package:route_runner/screens/service_report_view/service_report_screen.dart';
import '../../common/common_text_fild.dart';
import '../../service/pref_services.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      key: homeController.scaffoldKey,
      body: SingleChildScrollView(
        child: GetBuilder<HomeController>(
            id: 'home',
            builder: (context) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: Get.height * 0.27,
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
                              width: Get.width * 0.29,
                            ),
                            Image.asset(
                              AssetRes.locator,
                              scale: 3,
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                            InkWell(
                              onTap: () {
                                homeController.scaffoldKey.currentState?.openEndDrawer();
                              },
                              child: Image.asset(
                                AssetRes.drawer,
                                scale: 3,
                              ),
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
                    height: Get.height * 0.17,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: ColorRes.white),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 180),
                          child:
                              Text(StringRes.newCollection, style: commonTitle().copyWith(fontWeight: FontWeight.w700)),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: Get.width * 0.6,
                                child: CommonTextField(
                                  type: TextInputType.number,
                                  borderRadius: 7,
                                  contentPadding: 10,
                                  containerHeight: Get.height * 0.06,
                                  color: ColorRes.tffGrey,
                                  controller: homeController.auditController,
                                  hintText: StringRes.auditNumber,
                                )),
                            /*Container(
                                height: Get.height * 0.055,
                                width: Get.width * 0.125,
                                decoration:
                                    BoxDecoration(color: ColorRes.mainColor, borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    StringRes.go,
                                    style: commonTitle().copyWith(fontSize: 14, color: ColorRes.white),
                                  ),
                                ))*/
                            Column(
                              children: [
                                Container(
                                  height: 7,
                                ),
                                Container(
                                    height: Get.height * 0.059,
                                    width: Get.width * 0.12,
                                    decoration: BoxDecoration(
                                        color: ColorRes.mainColor, borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        StringRes.go,
                                        style: commonTitle().copyWith(fontSize: 15, color: ColorRes.white),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 10,
                      right: 10,
                    ),
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: ColorRes.white),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 15),
                              child: Expanded(
                                child: Text(
                                  StringRes.recentCollection,
                                  style: commonTitle().copyWith(fontWeight: FontWeight.w700, fontSize: width * 0.042),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.34,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 15),
                              child: Expanded(
                                child: Image.asset(
                                  AssetRes.menu,
                                  scale: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 1,
                            ),
                            Text(
                              StringRes.serialNo,
                              style: commonSubtitle().copyWith(fontSize: width * 0.04),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              AssetRes.arrowDown,
                              color: ColorRes.grey4,
                              scale: 3,
                            ),
                            SizedBox(
                              width: Get.width * 0.1,
                            ),
                            Text(
                              StringRes.location,
                              style: commonSubtitle().copyWith(fontSize: width * 0.04),
                            ),
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Image.asset(
                              AssetRes.arrowDown,
                              color: ColorRes.grey4,
                              scale: 3,
                            ),
                            SizedBox(
                              width: Get.width * 0.13,
                            ),
                            Text(
                              StringRes.total,
                              style: commonSubtitle().copyWith(fontSize: width * 0.04),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        homeController.dividers(5, 5),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: homeController.recentCollectionList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${homeController.recentCollectionList[index].serialNo}",
                                      // 'Moonlight Bar',
                                      style: GoogleFonts.nunito(
                                          fontSize: width * 0.034, fontWeight: FontWeight.w400, color: ColorRes.black),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.09,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.37,
                                      child: Text(
                                        "${homeController.recentCollectionList[index].location}",
                                        style: GoogleFonts.nunito(
                                            fontSize: 12, fontWeight: FontWeight.w400, color: ColorRes.black),
                                      ),
                                    ),
                                    Text(
                                      "${homeController.recentCollectionList[index].total}",
                                      style: GoogleFonts.nunito(
                                          fontSize: width * 0.034, fontWeight: FontWeight.w400, color: ColorRes.black),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.04,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (homeController.isViewData[index] == false) {
                                          homeController.isViewData[index] = true;
                                        } else {
                                          homeController.isViewData[index] = false;
                                        }
                                        homeController.update(['home']);
                                      },
                                      child: homeController.isViewData[index]
                                          ? const Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color: ColorRes.grey3,
                                              size: 22,
                                            )
                                          : const Icon(
                                              Icons.keyboard_arrow_right,
                                              color: ColorRes.grey3,
                                              size: 22,
                                            ),
                                    )
                                  ],
                                ),
                                homeController.isViewData[index]
                                    ? SizedBox(
                                        child: ListView.separated(
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: homeController.recentCollectionList[index].listData?.length ?? 0,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: Get.width * 0.205,
                                                          ),
                                                          Expanded(
                                                            child: SizedBox(
                                                              // width: Get.width * 0.1,
                                                              child: Text(
                                                                // homeController.recentCollectionList[index]
                                                                //     .listData![index].machine
                                                                //     .toString(),
                                                                //   "\$ ${controller.calculateTotalValue(controller.allCollectionData[index].machineDetails?[i].current![0].In, controller.allCollectionData[index].machineDetails?[i].previous?[0].In)}",
                                                                // homeController.recentCollectionList[index]
                                                                //     .locationDetails?[i].current![0].pre as String,
                                                                'Machine: 7',
                                                                style: GoogleFonts.nunito(
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight.w500,
                                                                    color: ColorRes.grey),
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'Previous',
                                                                style: GoogleFonts.nunito(
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight.w500,
                                                                    color: ColorRes.grey),
                                                              ),
                                                              Text(
                                                                'Current',
                                                                style: GoogleFonts.nunito(
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight.w500,
                                                                    color: ColorRes.grey),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: Get.width * 0.03,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                '\$2500',
                                                                style: GoogleFonts.nunito(
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight.w500,
                                                                    color: ColorRes.grey),
                                                              ),
                                                              Text(
                                                                '\$2000',
                                                                style: GoogleFonts.nunito(
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight.w500,
                                                                    color: ColorRes.grey),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: Get.width * 0.04,
                                                            height: Get.height * 0.05,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ));
                                          },
                                          separatorBuilder: (BuildContext context, int index) {
                                            return const SizedBox(
                                              height: 20,
                                            );
                                          },
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 20),
                                child: SizedBox(
                                  width: Get.width * 0.35,
                                  child: Text(
                                    StringRes.pendingRepairs,
                                    style: commonTitle().copyWith(fontWeight: FontWeight.w700, fontSize: width * 0.042),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 140, top: 20),
                                child: Image.asset(
                                  AssetRes.menu,
                                  scale: 3,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            // height: Get.height * 0.6,
                            child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.53,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Serialno:  ${'#1-876364'}",
                                              style: commonSubtitle().copyWith(fontSize: width * 0.038),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Reporter: Steven',
                                        style: commonSubtitle().copyWith(fontSize: width * 0.038),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.52,
                                        child: Text(
                                          'Location: Moonlight Bar',
                                          style: commonSubtitle().copyWith(fontSize: width * 0.038),
                                        ),
                                      ),
                                      Text(
                                        'Date: 15 Dec, 2023',
                                        style: commonSubtitle().copyWith(fontSize: width * 0.034),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.52,
                                        child: Text(
                                          'Issue: Joy stick not working',
                                          style: commonSubtitle().copyWith(fontSize: width * 0.038),
                                        ),
                                      ),
                                      Text(
                                        'Time: 11:06 AM',
                                        style: commonSubtitle().copyWith(fontSize: width * 0.034),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: ColorRes.grey,
                                    thickness: 0.1,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  // homeController.dividers(12, 7),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                ],
              );
            }),
      ),
      endDrawer: GetBuilder<HomeController>(
        id: 'home',
        builder: (controller) {
          return Drawer(
              width: Get.width * 0.68,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: Get.height * 0.1, bottom: 30),
                    child: Row(
                      children: [
                        Container(
                          height: 43,
                          width: 45,
                          decoration: const BoxDecoration(
                              image: DecorationImage(fit: BoxFit.fill, image: AssetImage(AssetRes.profilePhotoDrawer)),
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jim Gallagher",
                                style: GoogleFonts.nunito(
                                    fontSize: 14, fontWeight: FontWeight.w600, color: ColorRes.black)),
                            SizedBox(
                              height: 2,
                            ),
                            Text("Employee",
                                style: GoogleFonts.nunito(
                                    fontSize: 10, fontWeight: FontWeight.w400, color: ColorRes.grey)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: homeController.dividers(5, 5),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: homeController.imageList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Get.back();
                            homeController.Currentindex(index);
                            homeController.update(['home']);
                            if (homeController.currentIndex == 0) {
                              Get.to(() => CollectionReportScreen());
                            } else if (homeController.currentIndex == 1) {
                              Get.to(() => RepairScreen());
                            } else if (homeController.currentIndex == 2) {
                              Get.to(() => const ServiceReportScreen());
                            } else if (homeController.currentIndex == 3) {
                              Get.to(() => const AdminScreen());
                              PrefService.clear();
                            }
                          },
                          child: ListTile(
                            leading: Image.asset(
                              homeController.imageList[index],
                              scale: 4,
                            ),
                            title: Text(homeController.drawerTitle[index].toString(),
                                style: GoogleFonts.nunito(
                                    fontSize: 16, fontWeight: FontWeight.w600, color: ColorRes.color9A9AA9)),
                          ));
                    },
                  ))
                ],
              ));
        },
      ),
    );
  }
}
