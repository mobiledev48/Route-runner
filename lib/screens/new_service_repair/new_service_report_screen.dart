import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/appbar.dart';
import 'package:route_runner/common/common_text_fild.dart';
import 'package:route_runner/screens/new_service_repair/new_service_report_controller.dart';

import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/strings.dart';

import '../../utils/text_style.dart';

class NewServiceRepairScreen extends StatelessWidget {
  const NewServiceRepairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewServiceReportController newServiceReportController = Get.put(NewServiceReportController());
    return Scaffold(
        backgroundColor: ColorRes.white,
        appBar: customAppbar(
            title: StringRes.newServiceRepair,
            leadingOnpress: () {
              Get.back();
            },
            action: false),
        body: InkWell(
          splashColor:Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap:(){
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              GetBuilder<NewServiceReportController>(
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

                                CommonTextField(
                                    readOnly: true,
                                    type: TextInputType.number,
                                    color: ColorRes.bgColor,
                                    isRequired: true,
                                    hintText: "Moonlight Bar",
                                    titleText: StringRes.location,
                                    suffixIcon: AssetRes.arrowDown,
                                    suffixIconOnTap: () {
                                      newServiceReportController.isClick = ! newServiceReportController.isClick;
                                      controller.update(['newRepair']);
                                    },
                                    suffixIconSize: 3,
                                    isSuffixIcon: true,
                                    controller: controller.locationController),
                                (newServiceReportController.locationError != "")
                                    ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(newServiceReportController.locationError.tr,
                                        style: commonSubtitle().copyWith(color: ColorRes.red)),
                                  ),
                                )
                                    : const SizedBox(),
                                newServiceReportController.isClick == false
                                    ? const SizedBox()
                                    : Container(
                                  // height: Get.height * 0.26,
                                    width: Get.width * 0.9,
                                    decoration: const BoxDecoration(color: ColorRes.bgColor),
                                    child: ListView.separated(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) => GestureDetector(
                                          onTap: () {

                                            newServiceReportController.locationIndex = null;
                                            newServiceReportController.machineNumberController.clear();
                                            newServiceReportController.auditNumberController.clear();
                                            newServiceReportController.enterSerialNumberController.clear();
                                            newServiceReportController.locationController.text = newServiceReportController.locationsData[index].locationname ?? "";
                                            newServiceReportController.locationId = newServiceReportController.locationsData[index].id ?? "";
                                            //  newReportController.machineType;
                                            newServiceReportController.getMachines();
                                            newServiceReportController.locationIndex = index;
                                            newServiceReportController.isClick = false;
                                            newServiceReportController.update(['newRepair']);
                                          },
                                          child: ListTile(
                                            title: Text( newServiceReportController.locationsData[index].locationname ?? "",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorRes.color030229,
                                                )),
                                          ),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const Divider(color: ColorRes.grey3, endIndent: 10, indent: 10, height: 1),
                                        itemCount: newServiceReportController.locationsData.length)),

                                const SizedBox(
                                  height: 20,
                                ),
                                (newServiceReportController.machineData.isNotEmpty)?
                                Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            CommonTextField(
                                                readOnly: true,
                                                color: ColorRes.tffGrey,
                                                type: TextInputType.number,
                                                isRequired: true,
                                                hintText: "#12",
                                                suffixIcon:
                                                AssetRes
                                                    .arrowDown,
                                                suffixIconOnTap:
                                                    () {
                                                  newServiceReportController
                                                      .isClickMachine =
                                                  !newServiceReportController
                                                      .isClickMachine;

                                                  controller
                                                      .update([
                                                    'newRepair'
                                                  ]);
                                                },
                                                suffixIconSize:
                                                3,
                                                isSuffixIcon:
                                                true,
                                                titleText: StringRes.machineNumber,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(2), // Limit input to 2 characters
                                                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                                                ],
                                                controller: controller.machineNumberController),

                                            newServiceReportController
                                                .isClickMachine ==
                                                false
                                                ? const SizedBox()
                                                : (controller
                                                .locationIndex !=
                                                null && controller.machineData.isNotEmpty)
                                                ? Container(
                                                width: Get.width *
                                                    0.9,
                                                decoration:
                                                const BoxDecoration(color: ColorRes.bgColor),
                                                child: ListView.separated(
                                                  physics:
                                                  const NeverScrollableScrollPhysics(),
                                                  shrinkWrap:
                                                  true,
                                                  separatorBuilder: (context, index) => const Divider(
                                                      color: ColorRes.grey3,
                                                      endIndent: 10,
                                                      indent: 10,
                                                      height: 1),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        controller.machineNumberController.text = controller.machineData[0].machines?[index].machineNumber ?? "";
                                                        controller.enterSerialNumberController.text = controller.machineData[0].machines?[index].serialNumber ?? "";
                                                        controller.auditNumberController.text = controller.machineData[0].machines?[index].gameName ?? "";

                                                        newServiceReportController.isClickMachine = false;
                                                        newServiceReportController.update([
                                                          'newRepair'
                                                        ]);
                                                      },
                                                      child: ListTile(
                                                        title: Text(controller.machineData[0].machines![index].machineNumber ?? "",
                                                            style: GoogleFonts.nunito(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.color030229,
                                                            )),
                                                      ),
                                                    );
                                                  },
                                                  itemCount:
                                                  controller.machineData[0].machines!.length,
                                                ))
                                                : const SizedBox(),

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
                                                readOnly: true,
                                                color: ColorRes.tffGrey,
                                                type: TextInputType.number,
                                                isRequired: true,

                                                hintText: StringRes.entersSerialNumber,

                                                suffixIcon:
                                                AssetRes
                                                    .arrowDown,
                                                suffixIconOnTap:
                                                    () {
                                                  newServiceReportController
                                                      .isClickSerial =
                                                  !newServiceReportController
                                                      .isClickSerial;

                                                  controller
                                                      .update([
                                                    'newRepair'
                                                  ]);
                                                },
                                                suffixIconSize:
                                                3,
                                                isSuffixIcon:
                                                true,
                                                titleText: StringRes.serialNumber,
                                                controller: controller.enterSerialNumberController),

                                            newServiceReportController
                                                .isClickSerial ==
                                                false
                                                ? const SizedBox()
                                                : (controller
                                                .locationIndex !=
                                                null)
                                                ? Container(
                                              // height: Get.height * 0.26,
                                                width: Get.width *
                                                    0.9,
                                                decoration:
                                                const BoxDecoration(color: ColorRes.bgColor),
                                                child: ListView.builder(
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemBuilder: (context, index) => (controller.machineData[index].id == controller.locationId)
                                                        ? ListView.separated(
                                                      physics: const NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      separatorBuilder: (context, index) => const Divider(color: ColorRes.grey3, endIndent: 10, indent: 10, height: 1),
                                                      itemBuilder: (context, i) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            controller.enterSerialNumberController.text = controller.machineData[index].machines?[i].serialNumber ?? "";
                                                            controller.machineNumberController.text = controller.machineData[index].machines?[i].machineNumber ?? "";
                                                            controller.auditNumberController.text = controller.machineData[index].machines?[i].gameName ?? "";
                                                            newServiceReportController.isClickSerial = false;
                                                            newServiceReportController.update(['newRepair']);
                                                          },
                                                          child: ListTile(
                                                            title: Text(controller.machineData[index].machines![i].serialNumber ?? "",
                                                                style: GoogleFonts.nunito(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorRes.color030229,
                                                                )),
                                                          ),
                                                        );
                                                      },
                                                      itemCount: controller.machineData[index].machines!.length,
                                                    )
                                                        : const SizedBox(),
                                                    itemCount: controller.machineData.length))
                                                : const SizedBox(),
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
                                      readOnly: true,
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
                                      titleText: StringRes.employee,
                                      controller: controller.employeeController),
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
                                      titleText: StringRes.serviceRequested,
                                      controller: controller.serviceRequestedController),
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
                                        child: Column(
                                          children: [
                                            GestureDetector(
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
                                            (controller.imageError != "")
                                                ? Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 3),
                                                child: Text(controller.imageError.tr,
                                                    style: commonSubtitle().copyWith(color: ColorRes.red)),
                                              ),
                                            )
                                                : const SizedBox(),
                                          ],
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
                                        : const SizedBox(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ):const SizedBox(),
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
                                              borderRadius: const BorderRadius.all(Radius.circular(10))),
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

                                            // Get.offAll(ServiceReportScreen());
                                            controller.addNewServiceRepair(location: controller.locationId,machineNumber: controller.machineNumberController.text,
                                                serialNumber: controller.enterSerialNumberController.text, auditNumber: controller.auditNumberController.text, date:
                                                controller.data, time: controller.timeController.text,employeeName: controller.employeeController.text,
                                              serviceRequested: controller.serviceRequestedController.text,image: controller.downloadUrl

                                            ).then((value) {
                                              if(value == false)
                                              {
                                                controller.locationController.clear();
                                                controller.locationId = "";
                                                controller.machineNumberController.clear();
                                                controller.enterSerialNumberController.clear();
                                                controller.auditNumberController.clear();
                                                controller.dateController.clear();
                                                controller.timeController.clear();
                                                controller.employeeController.clear();
                                                controller.serviceRequestedController.clear();
                                                controller.data = "";
                                                controller.downloadUrl = "";
                                                controller.image = null;
                                              }
                                            });
                                            Get.back();
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 180,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorRes.color5B93FF,
                                              border: Border.all(width: 1, color: ColorRes.color5B93FF),
                                              borderRadius: const BorderRadius.all(Radius.circular(10))),
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
              ),
              Obx(()=> newServiceReportController.loader.value ? const Center(child: CircularProgressIndicator(),):const SizedBox())
            ],
          ),
        ));
  }
}
