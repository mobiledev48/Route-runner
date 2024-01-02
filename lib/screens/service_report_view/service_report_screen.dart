import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/appbar.dart';
import 'package:route_runner/screens/new_service_repair/new_service_report_screen.dart';
import 'package:route_runner/screens/service_report_view/service_report_controller.dart';
import 'package:route_runner/utils/color_res.dart';
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
        appBar: customAppbar(
          title: StringRes.serviceReport,
          leadingOnpress: () {
            Get.back();
          },
          action: true,
          actionOnpress: () {
            Get.to(const NewServiceRepairScreen());
          },
        ),
        body: GetBuilder<ServiceReportController>(
          id: 'service',
          builder: (controller) {
            return Padding(
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
                      controller.searchTerm = 'Moonlight'; // Change this to your desired search term
                      controller.searchResults = controller.searchServiceReportData(serviceReportData, value);
                      print(controller.searchResults);
                      controller.update(['service']);
                    },
                  ),
                  controller.searchController.text.isEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: serviceReportData.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      height: 75,
                                      width: Get.width,
                                      padding: EdgeInsets.symmetric(horizontal: 13),
                                      decoration:
                                          BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Text(
                                            serviceReportData[index].title,
                                            style: GoogleFonts.nunito(
                                                fontSize: 10, fontWeight: FontWeight.w700, color: ColorRes.color030229),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            serviceReportData[index].subtitle,
                                            style: GoogleFonts.nunito(
                                                fontSize: 9, fontWeight: FontWeight.w400, color: ColorRes.color030229),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                serviceReportData[index].subtitle1,
                                                style: GoogleFonts.nunito(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w400,
                                                    color: ColorRes.color030229),
                                              ),
                                              Text('Date: 12 Dec, 2020',
                                                  style: GoogleFonts.nunito(
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.w400,
                                                      color: ColorRes.color030229))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                        )
                      : controller.searchResults.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: controller.searchResults.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: 75,
                                          width: Get.width,
                                          padding: EdgeInsets.symmetric(horizontal: 13),
                                          decoration: BoxDecoration(
                                              color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              Text(
                                                controller.searchResults[index].title,
                                                style: GoogleFonts.nunito(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700,
                                                    color: ColorRes.color030229),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                controller.searchResults[index].subtitle,
                                                style: GoogleFonts.nunito(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w400,
                                                    color: ColorRes.color030229),
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    controller.searchResults[index].subtitle1,
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.w400,
                                                        color: ColorRes.color030229),
                                                  ),
                                                  Text('Date: 12 Dec, 2020',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 8,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorRes.color030229))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Text(
                                StringRes.notFound,
                                style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ),
                ],
              ),
            );
          },
        ));
  }
}
