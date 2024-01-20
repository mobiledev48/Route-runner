import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:route_runner/screens/collection_report/collection_report.dart';
import 'package:route_runner/screens/collection_report/collection_report_controller.dart';
import 'package:route_runner/screens/new_collection/new_collection_controller.dart';
import 'dart:io';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';
import 'collection_detail_controller.dart';

class CollectionDetailScreen extends StatelessWidget {
  CollectionDetailScreen({super.key});
  CollectionDetailController controller = Get.put(CollectionDetailController());
  NewCollectionController newCollectionController = Get.put(NewCollectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: Get.height * 0.13,
                width: Get.width,
                color: ColorRes.mainColor,
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: ColorRes.white,
                          size: 20,
                        )),
                    SizedBox(width: 20),
                    Text(
                      StringRes.collectionDetail,
                      style: appbarStyle().copyWith(fontSize: 20),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AssetRes.print,
                          scale: 3,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //   image: FileImage(File(newCollectionController.image!.path)),
                        //   fit: BoxFit.cover, // Choose the BoxFit that suits your needs
                        // ),
                      ),
                      child: newCollectionController.addCampaignData[0].image != ""?
                          Image.file(File(newCollectionController.addCampaignData[0].image ?? ""),height: 180,)
                          :Image.asset(
                        AssetRes.photo,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                     // height: Get.height * 0.25,
                      width: Get.width,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: Get.width * 0.4,
                                child: Text(
                                  StringRes.machine,
                                  style: title().copyWith(fontSize: 15),
                                ),
                              ),
                              // SizedBox(
                              //   width: Get.width * 0.35,
                              // ),
                              Text(
                                'Date: ${DateFormat('dd MMM, yyyy').format(DateTime.now())}',
                                style: subTitle().copyWith(fontSize: 10),
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text(
                                'Time: ${DateFormat('h:mm a').format(DateTime.now())}',
                                style: subTitle().copyWith(fontSize: 10),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '#${newCollectionController.addCampaignData[0].machineNumber}-${newCollectionController.addCampaignData[0].serialNumber}',
                                style: subTitle().copyWith(fontSize: 14, color: ColorRes.grey2),
                              ),
                              // SizedBox(
                              //   width: Get.width * 0.1,
                              // ),
                              Text(
                                StringRes.current,
                                style: subTitle().copyWith(fontSize: 14, color: ColorRes.grey2),
                              ),
                              // SizedBox(
                              //   width: Get.width * 0.1,
                              // ),
                              Text(
                                StringRes.previous,
                                style: subTitle().copyWith(fontSize: 14, color: ColorRes.grey2),
                              ),
                              // SizedBox(
                              //   width: Get.width * 0.02,
                              // ),
                              Text(
                                StringRes.total,
                                style: subTitle().copyWith(fontSize: 14, color: ColorRes.grey2),
                              ),

                            ],
                          ),

                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text(
                             "In",
                              style: title().copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "\$${newCollectionController.currentNumberInController.text}",
                              style: title().copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "\$${newCollectionController.previousNumberInController.text}",
                              style: title().copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "\$${controller.calculateSubtractedValue(int.parse(newCollectionController.currentNumberInController.text),
                                  int.parse(newCollectionController.previousNumberInController.text))}",
                              style: title().copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],),
                          const SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text(
                              "Out",
                              style: title().copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "\$${newCollectionController.currentNumberOutController.text}",
                              style: title().copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "\$${newCollectionController.previousNumberOutController.text}",
                              style: title().copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "\$${controller.calculateSubtractedValue(int.parse(newCollectionController.currentNumberOutController.text),
                                  int.parse(newCollectionController.previousNumberOutController.text))}",
                              style: title().copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: SizedBox(
                              // width: Get.width * 0.1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Profit: ', style: title().copyWith(fontSize: 15, fontWeight: FontWeight.w500)),
                                  Text(
                                    "\$ ${controller.calculateTotalValue(
                                        controller.calculateSubtractedValue(int.parse(newCollectionController.currentNumberInController.text),
                                            int.parse(newCollectionController.previousNumberInController.text)),
                                        controller.calculateSubtractedValue(int.parse(newCollectionController.currentNumberOutController.text),
                                            int.parse(newCollectionController.previousNumberOutController.text))
                                    )}",
                                    style: TextStyle(color:  (controller.calculateTotalValue(
                                        controller.calculateSubtractedValue(int.parse(newCollectionController.currentNumberInController.text),
                                            int.parse(newCollectionController.previousNumberInController.text)),
                                        controller.calculateSubtractedValue(int.parse(newCollectionController.currentNumberOutController.text),
                                            int.parse(newCollectionController.previousNumberOutController.text))
                                    ) < 0)
                                ? ColorRes.red
                                : ColorRes.green,),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Obx(()=> controller.loader.value ? Center(child: CircularProgressIndicator(),):SizedBox())
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () {

            controller.addNewRepair(location: newCollectionController.locationId, machineNumber: newCollectionController.machineNumberController.text,
                serialNumber: newCollectionController.enterSerialNumberController.text, auditNumber: newCollectionController.auditNumberController.text,
                inNumbersPrevious:  newCollectionController.previousNumberInController.text, inNumbersCurrent: newCollectionController.currentNumberInController.text,
                outNumbersPrevious: newCollectionController.previousNumberOutController.text, outNumbersCurrent: newCollectionController.currentNumberOutController.text,
                total: controller.calculateTotalValue(
                    controller.calculateSubtractedValue(int.parse(newCollectionController.currentNumberInController.text),
                        int.parse(newCollectionController.previousNumberInController.text)),
                    controller.calculateSubtractedValue(int.parse(newCollectionController.currentNumberOutController.text),
                        int.parse(newCollectionController.previousNumberOutController.text))
                ).toString(), image: newCollectionController.downloadUrl).then((value) {
                  if(value == false)
                    {
                      CollectionReportController controller = Get.put(CollectionReportController());
                      controller.currentPage = 0;
                      controller.getCollectionReport(page: controller.currentPage);
                      newCollectionController.locationId = "";
                      newCollectionController.image = null;
                      newCollectionController.locationController.clear();
                      newCollectionController.machineNumberController.clear();
                      newCollectionController.enterSerialNumberController.clear();
                      newCollectionController.auditNumberController.clear();
                      newCollectionController.currentNumberInController.clear();
                      newCollectionController.currentNumberOutController.clear();

                    }
            });
            // Get.offAll(CollectionReportScreen());
          },
          child: Container(
              height: Get.height * 0.07,
              width: Get.width * 0.9,
              decoration: BoxDecoration(color: ColorRes.mainColor, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                StringRes.save,
                style: TextStyle(fontSize: 16, color: ColorRes.white),
              ))),
        ),
      ),
    );
  }
}
