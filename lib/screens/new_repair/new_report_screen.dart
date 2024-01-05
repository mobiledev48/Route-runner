import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/appbar.dart';
import 'package:route_runner/common/common_text_fild.dart';
import 'package:route_runner/screens/new_repair/new_report_controller.dart';

import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/strings.dart';

import '../../utils/text_style.dart';
import '../repair/repair_screen.dart';

class NewRepairScreen extends StatelessWidget {
  const NewRepairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewReportController newReportController = Get.put(NewReportController());
    return Scaffold(
        backgroundColor: ColorRes.white,
        appBar: customAppbar(
            title: StringRes.newRepair,
            leadingOnpress: () {
              Get.back();
            },
            action: false),
        body: GetBuilder<NewReportController>(
          id: 'newRepair',
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CommonTextField(
                                        color: ColorRes.tffGrey,
                                        type: TextInputType.number,
                                        isRequired: true,
                                        hintText: "#12",
                                        titleText: StringRes.machineNumber,
                                        controller: controller.machineNumberController),
                                    (controller.machineError != "")
                                        ? Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 3),
                                              child: Text(controller.machineError.tr,
                                                  style: commonSubtitle().copyWith(color: ColorRes.red)),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    CommonTextField(
                                        color: ColorRes.tffGrey,
                                        type: TextInputType.number,
                                        isRequired: true,
                                        hintText: StringRes.entersSerialNumber,
                                        titleText: StringRes.serialNumber,
                                        controller: controller.enterSerialNumberController),
                                    (controller.serialError != "")
                                        ? Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 3),
                                              child: Text(controller.serialError.tr,
                                                  style: commonSubtitle().copyWith(color: ColorRes.red)),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                              color: ColorRes.tffGrey,
                              type: TextInputType.number,
                              isRequired: true,
                              hintText: "4652387645",
                              titleText: StringRes.auditsNumber,
                              controller: controller.auditNumberController),
                          (controller.auditError != "")
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(controller.auditError.tr,
                                        style: commonSubtitle().copyWith(color: ColorRes.red)),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CommonTextField(
                                      color: ColorRes.tffGrey,
                                      suffixIconOnTap: () {
                                        controller.selectDate(context);
                                        controller.update(['newRepair']);
                                      },
                                      readOnly: true,
                                      isSuffixIcon: true,
                                      isRequired: true,
                                      hintText: "10 Dec, 2020",
                                      titleText: StringRes.date,
                                      controller: controller.dateController,
                                      suffixIcon: AssetRes.calendar,
                                      suffixIconSize: 2,
                                    ),
                                    (controller.dateError != "")
                                        ? Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 3),
                                              child: Text(controller.dateError.tr,
                                                  style: commonSubtitle().copyWith(color: ColorRes.red)),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    CommonTextField(
                                      color: ColorRes.tffGrey,
                                      suffixIconOnTap: () {
                                        controller.selectTime(context);
                                        controller.update(['newRepair']);
                                      },
                                      readOnly: true,
                                      isRequired: true,
                                      isSuffixIcon: true,
                                      hintText: "11:00 AM",
                                      titleText: StringRes.time,
                                      controller: controller.timeController,
                                      suffixIcon: AssetRes.timeCircle,
                                      suffixIconSize: 4,
                                    ),
                                    (controller.timeError != "")
                                        ? Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 3),
                                              child: Text(controller.timeError.tr,
                                                  style: commonSubtitle().copyWith(color: ColorRes.red)),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                              color: ColorRes.tffGrey,
                              isRequired: true,
                              hintText: StringRes.steven,
                              titleText: StringRes.reporter,
                              controller: controller.reporterController),
                          (controller.reporterError != "")
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(controller.reporterError.tr,
                                        style: commonSubtitle().copyWith(color: ColorRes.red)),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                              color: ColorRes.tffGrey,
                              containerHeight: 130,
                              maxLines: 4,
                              isRequired: true,
                              hintText: StringRes.jobStickNot,
                              titleText: StringRes.issue,
                              controller: controller.issueController),
                          (controller.issueError != "")
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(controller.issueError.tr,
                                        style: commonSubtitle().copyWith(color: ColorRes.red)),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () async {
                                    await controller.getImageFromCamera();
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ColorRes.color5B93FF,
                                        border: Border.all(width: 1, color: ColorRes.color5B93FF),
                                        borderRadius: const BorderRadius.all(Radius.circular(10))),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.06,
                                        ),
                                        Image.asset(
                                          AssetRes.camera,
                                          scale: 5,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          StringRes.captureMachineReading,
                                          style: GoogleFonts.nunito(
                                              fontSize: 14, fontWeight: FontWeight.w400, color: ColorRes.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer()
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: controller.image != null
                                ? Container(
                                    height: 150,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(File(controller.image!.path)),
                                        fit: BoxFit.cover, // Choose the BoxFit that suits your needs
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 180,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1, color: ColorRes.color5B93FF),
                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text(
                                      StringRes.close,
                                      style: GoogleFonts.nunito(
                                          fontSize: 14, fontWeight: FontWeight.w400, color: ColorRes.color5B93FF),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 19,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    if (controller.validation()) {
                                      Get.to(() => RepairScreen());
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 180,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ColorRes.color5B93FF,
                                        border: Border.all(width: 1, color: ColorRes.color5B93FF),
                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text(
                                      StringRes.create,
                                      style: GoogleFonts.nunito(
                                          fontSize: 14, fontWeight: FontWeight.w400, color: ColorRes.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
