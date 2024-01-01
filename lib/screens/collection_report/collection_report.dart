import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/appbar.dart';
import '../../common/common_text_fild.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';
import '../location_view/location_controller.dart';
import 'collection_report_controller.dart';

class CollectionReportScreen extends StatelessWidget {
  CollectionReportScreen({super.key});

  LocationController locationController = Get.put(LocationController());
  CollectionReportController controller = Get.put(CollectionReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              size: 20,
            )),
        centerTitle: true,
        backgroundColor: ColorRes.mainColor,
        title: Text(
          StringRes.collectionReport,
          style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
        ),

        // automaticallyImplyLeading: false,
      ),
      body: GetBuilder<CollectionReportController>(
        id: 'collection',
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.06,
                    margin: EdgeInsets.only(bottom: 10),
                    child: CommomTextFormFeild(
                      controller: controller.searchController,
                      onChanged: (value) {
                        controller.searchTerm = 'Moonlight'; // Change this to your desired search term
                        controller.searchResults = controller.searchAllData(controller.allCollectionData, value);
                        print(controller.searchResults);
                        controller.update(['collection']);
                      },
                    )),
                controller.searchController.text.isEmpty
                    ? Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.allCollectionData.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    width: Get.width,
                                    decoration:
                                        BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 20, left: 5, right: 10),
                                                child: controller.customCheckbox(index),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 20),
                                                    Text(
                                                      "${controller.allCollectionData[index].title}",
                                                      // 'Moonlight Bar',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: ColorRes.black),
                                                    ),
                                                    SizedBox(height: 2),
                                                    Text(
                                                      "Employee: ${controller.allCollectionData[index].employeeName}",
                                                      // 'Admin: Arrora gaur',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 9,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorRes.color030229),
                                                    ),
                                                    SizedBox(height: 2),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Machine: ${controller.allCollectionData[index].machine}',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.color030229),
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Text(
                                                          'Beginning: ${controller.allCollectionData[index].machine}',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.color030229),
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Text(
                                                          'Closed: ${controller.allCollectionData[index].machine}',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.color030229),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 2),
                                                    Text(
                                                      "Address: ${controller.allCollectionData[index].address}",
                                                      // 'Admin: Arrora gaur',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 9,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorRes.color030229),
                                                    ),
                                                    SizedBox(height: 10),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(height: Get.height * 0.02),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        AssetRes.calendar,
                                                        scale: 2.5,
                                                      ),
                                                      const Text(
                                                        '12 Dec, 2020',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorRes.black,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: Get.height * 0.04),
                                                  GestureDetector(
                                                    onTap: () {
                                                      // if (controller.nextPage == 0) {
                                                      //   ListView.builder(
                                                      //     itemBuilder: (context, index) {
                                                      //       return Container(
                                                      //         height: Get.height * 0.8,
                                                      //         width: Get.width * 0.8,
                                                      //         decoration: BoxDecoration(color: ColorRes.grey),
                                                      //       );
                                                      //     },
                                                      //   );
                                                      // }
                                                      if (controller.isViewData[index] == false) {
                                                        controller.isViewData[index] = true;
                                                      } else {
                                                        controller.isViewData[index] = false;
                                                      }
                                                      controller.update(['collection']);
                                                    },
                                                    child: controller.isViewData[index]
                                                        ? const Icon(
                                                            Icons.keyboard_arrow_down_sharp,
                                                            color: ColorRes.grey,
                                                            size: 22,
                                                          )
                                                        : const Icon(
                                                            Icons.keyboard_arrow_right,
                                                            color: ColorRes.grey,
                                                            size: 22,
                                                          ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        controller.isViewData[index]
                                            ? SizedBox(
                                                child: ListView.separated(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      controller.allCollectionData[index].machineDetails?.length ?? 0,
                                                  itemBuilder: (context, i) {
                                                    return Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: 35,
                                                              width: Get.width * 0.9,
                                                              decoration: BoxDecoration(
                                                                  border:
                                                                      Border.all(width: 1, color: ColorRes.colorF2F2F2),
                                                                  borderRadius: const BorderRadius.only(
                                                                    topLeft: Radius.circular(10),
                                                                    topRight: Radius.circular(10),
                                                                  ),
                                                                  color: ColorRes.colorF2F2F2),
                                                              child: Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      'Machine- #${controller.allCollectionData[index].machineDetails?[i].machineId}-876364',
                                                                      style: GoogleFonts.nunito(
                                                                          fontSize: 10,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: ColorRes.color030229),
                                                                    ),
                                                                    SizedBox(
                                                                      width: Get.width * 0.14,
                                                                    ),
                                                                    Text(
                                                                      'Current',
                                                                      style: GoogleFonts.nunito(
                                                                          fontSize: 10,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: ColorRes.color030229),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    Text(
                                                                      'Previous',
                                                                      style: GoogleFonts.nunito(
                                                                          fontSize: 10,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: ColorRes.color030229),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    Text(
                                                                      'Total',
                                                                      style: GoogleFonts.nunito(
                                                                          fontSize: 10,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: ColorRes.color030229),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: Get.height * 0.16,
                                                              width: Get.width * 0.9,
                                                              decoration: BoxDecoration(
                                                                  border:
                                                                      Border.all(width: 1, color: ColorRes.colorF2F2F2),
                                                                  borderRadius: const BorderRadius.only(
                                                                    bottomLeft: Radius.circular(10),
                                                                    bottomRight: Radius.circular(10),
                                                                  ),
                                                                  color: ColorRes.white),
                                                              child: Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    horizontal: 10, vertical: 10),
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      width: 70,
                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              fit: BoxFit.fill,
                                                                              image: AssetImage(AssetRes.photo)),
                                                                          borderRadius: BorderRadius.circular(3)),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Expanded(
                                                                      child: Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 7,
                                                                                  child: Text(
                                                                                    'In',
                                                                                    style: GoogleFonts.nunito(
                                                                                        fontSize: 10,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        color: ColorRes.color030229),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  "\$ ${controller.allCollectionData[index].machineDetails?[i].current?[0].In}",
                                                                                  style: GoogleFonts.nunito(
                                                                                      fontSize: 10,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: ColorRes.color030229),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: Get.width * 0.07,
                                                                                ),
                                                                                Text(
                                                                                  "\$ ${controller.allCollectionData[index].machineDetails?[i].previous?[0].In}",
                                                                                  style: GoogleFonts.nunito(
                                                                                      fontSize: 10,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: ColorRes.color030229),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: Get.width * 0.05,
                                                                                ),
                                                                                Text(
                                                                                  "\$ ${controller.calculateTotalValue(controller.allCollectionData[index].machineDetails?[i].current![0].In, controller.allCollectionData[index].machineDetails?[i].previous?[0].In)}",
                                                                                  style: GoogleFonts.nunito(
                                                                                      fontSize: 10,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: ColorRes.color030229),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 7,
                                                                                  child: Text(
                                                                                    'Out',
                                                                                    style: GoogleFonts.nunito(
                                                                                        fontSize: 10,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        color: ColorRes.color030229),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  "\$ ${controller.allCollectionData[index].machineDetails?[i].current?[0].out}",
                                                                                  style: GoogleFonts.nunito(
                                                                                      fontSize: 10,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: ColorRes.color030229),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: Get.width * 0.07,
                                                                                ),
                                                                                Text(
                                                                                  "\$ ${controller.allCollectionData[index].machineDetails?[i].previous?[0].out}",
                                                                                  style: GoogleFonts.nunito(
                                                                                      fontSize: 10,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: ColorRes.color030229),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: Get.width * 0.07,
                                                                                ),
                                                                                Text(
                                                                                  // "\$ ${ controller.allCollectionData[index].machineDetails?[i].previous?[0].out}",
                                                                                  "\$ ${controller.calculateTotalValue(controller.allCollectionData[index].machineDetails?[i].current![0].out, controller.allCollectionData[index].machineDetails?[i].previous?[0].out)}",
                                                                                  style: GoogleFonts.nunito(
                                                                                      fontSize: 10,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: ColorRes.color030229),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 7,
                                                                                  child: Text(
                                                                                    'Total',
                                                                                    style: GoogleFonts.nunito(
                                                                                        fontSize: 10,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        color: ColorRes.color030229),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  "\$ ${controller.calculateTotalValue(controller.calculateTotalValue(controller.allCollectionData[index].machineDetails?[i].current![0].In, controller.allCollectionData[index].machineDetails?[i].previous?[0].In), controller.calculateTotalValue(controller.allCollectionData[index].machineDetails?[i].current![0].out, controller.allCollectionData[index].machineDetails?[i].previous?[0].out))}",
                                                                                  style: GoogleFonts.nunito(
                                                                                      fontSize: 10,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: (controller.calculateTotalValue(
                                                                                                  controller
                                                                                                      .allCollectionData[
                                                                                                          index]
                                                                                                      .machineDetails?[
                                                                                                          i]
                                                                                                      .previous?[0]
                                                                                                      .In,
                                                                                                  controller
                                                                                                      .allCollectionData[
                                                                                                          index]
                                                                                                      .machineDetails?[
                                                                                                          i]
                                                                                                      .previous?[0]
                                                                                                      .out) >=
                                                                                              0)
                                                                                          ? ColorRes.color3A974C
                                                                                          : Colors.red),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: Get.width * 0.004,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ));
                                                  },
                                                  separatorBuilder: (BuildContext context, int index) {
                                                    return const SizedBox(
                                                      height: 10,
                                                    );
                                                  },
                                                ),
                                              )
                                            : SizedBox(),
                                        controller.isViewData[index]
                                            ? Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Total profit- 600',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          color: ColorRes.black),
                                                    ),
                                                    Text(
                                                      '50%- 300',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          color: ColorRes.black),
                                                    ),
                                                    Text(
                                                      'Paid- 300',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          color: ColorRes.black),
                                                    ),
                                                    Text(
                                                      'Due- 0',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          color: ColorRes.black),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                )),
                      )
                    : controller.searchResults.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: controller.searchResults.length,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 20, left: 5, right: 10),
                                                    child: controller.customCheckbox(index),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 20),
                                                        Text(
                                                          "${controller.searchResults[index].title}",
                                                          // 'Moonlight Bar',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w600,
                                                              color: ColorRes.black),
                                                        ),
                                                        SizedBox(height: 2),
                                                        Text(
                                                          "Employee: ${controller.searchResults[index].employeeName}",
                                                          // 'Admin: Arrora gaur',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.color030229),
                                                        ),
                                                        SizedBox(height: 2),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Machine: ${controller.searchResults[index].machine}',
                                                              style: GoogleFonts.nunito(
                                                                  fontSize: 9,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorRes.color030229),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              'Beginning: ${controller.searchResults[index].machine}',
                                                              style: GoogleFonts.nunito(
                                                                  fontSize: 9,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorRes.color030229),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              'Closed: ${controller.searchResults[index].machine}',
                                                              style: GoogleFonts.nunito(
                                                                  fontSize: 9,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorRes.color030229),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2),
                                                        Text(
                                                          "Address: ${controller.searchResults[index].address}",
                                                          // 'Admin: Arrora gaur',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.color030229),
                                                        ),
                                                        SizedBox(height: 10),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      SizedBox(height: Get.height * 0.02),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            AssetRes.calendar,
                                                            scale: 2.5,
                                                          ),
                                                          const Text(
                                                            '12 Dec, 2020',
                                                            style: TextStyle(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.black,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: Get.height * 0.04),
                                                      GestureDetector(
                                                        onTap: () {
                                                          // if (controller.nextPage == 0) {
                                                          //   ListView.builder(
                                                          //     itemBuilder: (context, index) {
                                                          //       return Container(
                                                          //         height: Get.height * 0.8,
                                                          //         width: Get.width * 0.8,
                                                          //         decoration: BoxDecoration(color: ColorRes.grey),
                                                          //       );
                                                          //     },
                                                          //   );
                                                          // }
                                                          if (controller.isViewData[index] == false) {
                                                            controller.isViewData[index] = true;
                                                          } else {
                                                            controller.isViewData[index] = false;
                                                          }
                                                          controller.update(['collection']);
                                                        },
                                                        child: controller.isViewData[index]
                                                            ? const Icon(
                                                                Icons.keyboard_arrow_down_sharp,
                                                                color: ColorRes.grey,
                                                                size: 22,
                                                              )
                                                            : const Icon(
                                                                Icons.keyboard_arrow_right,
                                                                color: ColorRes.grey,
                                                                size: 22,
                                                              ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            controller.isViewData[index]
                                                ? SizedBox(
                                                    child: ListView.separated(
                                                      physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          controller.searchResults[index].machineDetails?.length ?? 0,
                                                      itemBuilder: (context, i) {
                                                        return Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 15),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  height: 35,
                                                                  width: Get.width * 0.9,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width: 1, color: ColorRes.colorF2F2F2),
                                                                      borderRadius: const BorderRadius.only(
                                                                        topLeft: Radius.circular(10),
                                                                        topRight: Radius.circular(10),
                                                                      ),
                                                                      color: ColorRes.colorF2F2F2),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          'Machine- #${controller.searchResults[index].machineDetails?[i].machineId}-876364',
                                                                          style: GoogleFonts.nunito(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: ColorRes.color030229),
                                                                        ),
                                                                        SizedBox(
                                                                          width: Get.width * 0.14,
                                                                        ),
                                                                        Text(
                                                                          'Current',
                                                                          style: GoogleFonts.nunito(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: ColorRes.color030229),
                                                                        ),
                                                                        const SizedBox(
                                                                          width: 15,
                                                                        ),
                                                                        Text(
                                                                          'Previous',
                                                                          style: GoogleFonts.nunito(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: ColorRes.color030229),
                                                                        ),
                                                                        const SizedBox(
                                                                          width: 15,
                                                                        ),
                                                                        Text(
                                                                          'Total',
                                                                          style: GoogleFonts.nunito(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: ColorRes.color030229),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: Get.height * 0.17,
                                                                  width: Get.width * 0.9,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width: 1, color: ColorRes.colorF2F2F2),
                                                                      borderRadius: const BorderRadius.only(
                                                                        bottomLeft: Radius.circular(10),
                                                                        bottomRight: Radius.circular(10),
                                                                      ),
                                                                      color: ColorRes.white),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        horizontal: 10, vertical: 10),
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          width: 70,
                                                                          decoration: BoxDecoration(
                                                                              image: DecorationImage(
                                                                                  fit: BoxFit.fill,
                                                                                  image: AssetImage(AssetRes.photo)),
                                                                              borderRadius: BorderRadius.circular(3)),
                                                                        ),
                                                                        const SizedBox(
                                                                          width: 10,
                                                                        ),
                                                                        Expanded(
                                                                          child: Column(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 7,
                                                                                      child: Text(
                                                                                        'In',
                                                                                        style: GoogleFonts.nunito(
                                                                                            fontSize: 10,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            color:
                                                                                                ColorRes.color030229),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      "\$ ${controller.searchResults[index].machineDetails?[i].current?[0].In}",
                                                                                      style: GoogleFonts.nunito(
                                                                                          fontSize: 10,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          color: ColorRes.color030229),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: Get.width * 0.07,
                                                                                    ),
                                                                                    Text(
                                                                                      "\$ ${controller.searchResults[index].machineDetails?[i].previous?[0].In}",
                                                                                      style: GoogleFonts.nunito(
                                                                                          fontSize: 10,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          color: ColorRes.color030229),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: Get.width * 0.07,
                                                                                    ),
                                                                                    Text(
                                                                                      "\$ ${controller.calculateTotalValue(controller.searchResults[index].machineDetails?[i].current![0].In, controller.searchResults[index].machineDetails?[i].previous?[0].In)}",
                                                                                      style: GoogleFonts.nunito(
                                                                                          fontSize: 10,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          color: ColorRes.color030229),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 7,
                                                                                      child: Text(
                                                                                        'Out',
                                                                                        style: GoogleFonts.nunito(
                                                                                            fontSize: 10,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            color:
                                                                                                ColorRes.color030229),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      "\$ ${controller.searchResults[index].machineDetails?[i].current?[0].out}",
                                                                                      style: GoogleFonts.nunito(
                                                                                          fontSize: 10,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          color: ColorRes.color030229),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: Get.width * 0.07,
                                                                                    ),
                                                                                    Text(
                                                                                      "\$ ${controller.searchResults[index].machineDetails?[i].previous?[0].out}",
                                                                                      style: GoogleFonts.nunito(
                                                                                          fontSize: 10,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          color: ColorRes.color030229),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: Get.width * 0.07,
                                                                                    ),
                                                                                    Text(
                                                                                      // "\$ ${ controller.allCollectionData[index].machineDetails?[i].previous?[0].out}",
                                                                                      "\$ ${controller.calculateTotalValue(controller.searchResults[index].machineDetails?[i].current![0].out, controller.searchResults[index].machineDetails?[i].previous?[0].out)}",
                                                                                      style: GoogleFonts.nunito(
                                                                                          fontSize: 10,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          color: ColorRes.color030229),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 7,
                                                                                      child: Text(
                                                                                        'Total',
                                                                                        style: GoogleFonts.nunito(
                                                                                            fontSize: 10,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            color:
                                                                                                ColorRes.color030229),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      "\$ ${controller.calculateTotalValue(controller.calculateTotalValue(controller.searchResults[index].machineDetails?[i].current![0].In, controller.searchResults[index].machineDetails?[i].previous?[0].In), controller.calculateTotalValue(controller.searchResults[index].machineDetails?[i].current![0].out, controller.searchResults[index].machineDetails?[i].previous?[0].out))}",
                                                                                      style: GoogleFonts.nunito(
                                                                                          fontSize: 10,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          color: (controller.calculateTotalValue(
                                                                                                      controller
                                                                                                          .searchResults[
                                                                                                              index]
                                                                                                          .machineDetails?[
                                                                                                              i]
                                                                                                          .previous?[0]
                                                                                                          .In,
                                                                                                      controller
                                                                                                          .searchResults[
                                                                                                              index]
                                                                                                          .machineDetails?[
                                                                                                              i]
                                                                                                          .previous?[0]
                                                                                                          .out) >=
                                                                                                  0)
                                                                                              ? ColorRes.color3A974C
                                                                                              : Colors.red),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: Get.width * 0.004,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ]),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ));
                                                      },
                                                      separatorBuilder: (BuildContext context, int index) {
                                                        return const SizedBox(
                                                          height: 10,
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : SizedBox(),
                                            controller.isViewData[index]
                                                ? Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Total profit- 600',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w600,
                                                              color: ColorRes.black),
                                                        ),
                                                        Text(
                                                          '50%- 300',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w600,
                                                              color: ColorRes.black),
                                                        ),
                                                        Text(
                                                          'Paid- 300',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w600,
                                                              color: ColorRes.black),
                                                        ),
                                                        Text(
                                                          'Due- 0',
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w600,
                                                              color: ColorRes.black),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      ),
                                    )),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                              'Not Found',
                              style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
              ],
            ),
          );
        },
      ),
    );
  }
}
