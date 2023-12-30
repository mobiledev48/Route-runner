import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/common_text_fild.dart';
import 'package:route_runner/screens/new_repair/new_report_controller.dart';

import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/strings.dart';

class NewRepairScreen extends StatelessWidget {
  const NewRepairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewReportController newReportController = Get.put(NewReportController());
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
            StringRes.newRepair,
            style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
          ),

          // automaticallyImplyLeading: false,
        ),
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
                                child: CommonTextField(
                                    type: TextInputType.number,
                                    isRequired: true,
                                    hintText: "#12",
                                    titleText: StringRes.machineNumber,
                                    controller: controller.machineNumberController),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CommonTextField(
                                    type: TextInputType.number,
                                    isRequired: true,
                                    hintText: StringRes.entersSerialNumber,
                                    titleText: StringRes.serialNumber,
                                    controller: controller.enterSerialNumberController),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                              type: TextInputType.number,
                              isRequired: true,
                              hintText: "4652387645",
                              titleText: StringRes.auditsNumber,
                              controller: controller.auditNumberController),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CommonTextField(
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
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CommonTextField(
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
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                              isRequired: true,
                              hintText: StringRes.steven,
                              titleText: StringRes.reporter,
                              controller: controller.reporterController),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                              containerHeight: 130,
                              maxLines: 4,
                              isRequired: true,
                              hintText: StringRes.jobStickNot,
                              titleText: StringRes.issue,
                              controller: controller.issueController),
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
                              Spacer()
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
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
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
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
                                )
                              ],
                            ),
                          ),
                          SizedBox(
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
