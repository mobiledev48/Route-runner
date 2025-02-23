import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:route_runner/screens/new_service_repair/new_service_report_controller.dart';
import 'package:route_runner/screens/new_service_repair/new_service_report_screen.dart';
import 'package:route_runner/screens/service_report_view/service_report_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/text_style.dart';
import '../../common/common_text_fild.dart';
import '../../utils/asset_res.dart';
import '../../utils/strings.dart';
import '../admin_view/admin_controller.dart';

class ServiceReportScreen extends StatelessWidget {
  const ServiceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceReportController serviceReportController = Get.put(ServiceReportController());
    AdminController adminController = Get.put(AdminController());

    return Scaffold(
        backgroundColor: ColorRes.bgColor,
     appBar: AppBar(
          leading: IconButton(
              onPressed:  () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                size: 20,
                color: ColorRes.white,
              )),
          centerTitle: true,
          backgroundColor: ColorRes.mainColor,
          title: Text(
            StringRes.serviceReport,
            style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                NewServiceReportController newServiceReportController = Get.put(NewServiceReportController());
                newServiceReportController.getLocation();
                Get.to(const NewServiceRepairScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.asset(AssetRes.addMenu,scale: 3,),
              ),
            )

          ]),
        body: Stack(
          children: [
            GetBuilder<ServiceReportController>(
              id: 'service',
              builder: (controller) {
                return Column(
                  children: [
                   /* Container(height: 60,color:ColorRes.mainColor,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_sharp,
                                size: 20,
                                color: ColorRes.white,
                              )),
                        ),

                        Text(
                          StringRes.serviceReport,
                          style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(onTap: () {
                            NewServiceReportController newServiceReportController = Get.put(NewServiceReportController());
                            newServiceReportController.getLocation();
                            Get.to(NewServiceRepairScreen());
                          }
                          ,child: Image.asset(AssetRes.addMenu,scale: 3,)),
                        ),
                      ]),),*/
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          children: [
                            CommonTextField(
                              containerHeight: Get.height * 0.07,
                              isSuffixIcon: true,
                              suffixIcon: AssetRes.search,
                              suffixIconSize: 3,
                              hintText: StringRes.search,
                              controller: controller.searchController,
                              onChanged: (value) {
                                controller.repairServiceReportData.clear();
                                controller.currentPage = 1;
                                controller.getServiceReport(page: controller.currentPage,search: value);
                                controller.update(['service']);
                              },
                            ),
                            controller.repairServiceReportData.isNotEmpty?
                            Expanded(
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        controller.repairServiceReportData.clear();
                                        controller.currentPage = 1;
                                        await controller.getServiceReport(page:  controller.currentPage);
                                        controller.update(['service']);
                                      },
                                      child: ListView.builder(
                                            controller: controller.scrollController,
                                          itemCount: controller.repairServiceReportData.length,
                                          itemBuilder: (context, index) => Padding(
                                                padding: const EdgeInsets.only(top: 10),
                                                child: Container(
                                                  // height: 75,
                                                  width: Get.width,
                                                  padding: const EdgeInsets.symmetric(horizontal: 13),
                                                  decoration:
                                                      BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(height: 10),
                                                      Text(
                                                          'SN: #${controller.repairServiceReportData[index].machineNumber?.substring(0,2) ?? ""}-${controller.repairServiceReportData[index].serialNumber ?? ""}',
                                                        style: title(),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                       "Employee: ${controller.repairServiceReportData[index].employeeName ?? ""}",
                                                        style: subTitle(),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "Issue: ${controller.repairServiceReportData[index].serviceRequested ?? ""}",
                                                              style: subTitle(),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Date: ${ DateFormat('dd MMM, yyyy').format(DateTime.parse( controller.repairServiceReportData[index].date ?? ""))}",
                                                            style: subTitle().copyWith(fontSize: 10),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(height: 10),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                    ),
                                  ):
                            controller.loader.value == false? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Text(
                                StringRes.notFound,
                                style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ):const SizedBox(),

                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Obx(()=> serviceReportController.loader.value ? const Center(child: CircularProgressIndicator(),):const SizedBox())
          ],
        ));
  }
}
