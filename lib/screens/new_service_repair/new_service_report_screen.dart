import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/common_text_fild.dart';
import 'package:route_runner/screens/new_service_repair/new_service_report_controller.dart';

import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/font_res.dart';
import 'package:route_runner/utils/strings.dart';

class NewServiceRepairScreen extends StatelessWidget {
  const NewServiceRepairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewServiceReportController newServiceReportController =
        Get.put(NewServiceReportController());
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp)),
              centerTitle: true,
              backgroundColor: ColorRes.mainColor,
              title: Text(
                StringRes.newServiceRepair,
                style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.white),
              ),

              // automaticallyImplyLeading: false,
            ),
            body: GetBuilder<NewServiceReportController>(
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
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CommonTextField(
                                        isRequired: true,
                                        hintText: "#12",
                                        titleText: StringRes.machineNumber,
                                        controller:
                                            controller.machineNumberController),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CommonTextField(
                                        isRequired: true,
                                        hintText: StringRes.entersSerialNumber,
                                        titleText: StringRes.serialNumber,
                                        controller: controller
                                            .enterSerialNumberController),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CommonTextField(
                                  isRequired: true,
                                  hintText: "4652387645",
                                  titleText: StringRes.auditsNumber,
                                  controller: controller.auditNumberController),
                              SizedBox(
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
                                  SizedBox(
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
                              SizedBox(
                                height: 20,
                              ),
                              CommonTextField(
                                  isRequired: true,
                                  hintText: StringRes.steven,
                                  titleText: StringRes.employee,
                                  controller: controller.employeeController),
                              SizedBox(
                                height: 20,
                              ),
                              CommonTextField(
                                  containerHeight: 130,
                                  maxLines: 4,
                                  isRequired: true,
                                  hintText: StringRes.jobStickNot,
                                  titleText: StringRes.serviceRequested,
                                  controller:
                                      controller.serviceRequestedController),
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
                                            border: Border.all(
                                                width: 1,
                                                color: ColorRes.color5B93FF),
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10))),
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
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorRes.white),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        width: 180,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: ColorRes.color5B93FF),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Text(
                                          StringRes.close,
                                          style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: ColorRes.color5B93FF),
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
                                            border: Border.all(
                                                width: 1,
                                                color: ColorRes.color5B93FF),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Text(
                                          StringRes.create,
                                          style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: ColorRes.white),
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
            )));
  }
}
