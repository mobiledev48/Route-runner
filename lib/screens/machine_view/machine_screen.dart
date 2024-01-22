import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/drop_down_menu.dart';
import 'package:route_runner/screens/dash_board/dash_board_controller.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/screens/machine_view/machine_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/text_style.dart';
import '../../common/appbar.dart';
import '../../common/common_text_fild.dart';
import '../../utils/asset_res.dart';
import '../../utils/strings.dart';

class MachineScreen extends StatelessWidget {
  MachineScreen({super.key});
  LocationController locationController = Get.put(LocationController());
  MachineController machineController = Get.put(MachineController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: ColorRes.bgColor,
        appBar: customAppbar(
          title: StringRes.machine,
          leadingOnpress: () {
            DashBoardController dashBoardController = Get.put(DashBoardController());
            dashBoardController.currentIndex = 0;
            dashBoardController.update(['dash']);
            machineController.update(['location']);
          },
          action: false,
        ),
        body: Stack(
          children: [
            GetBuilder<MachineController>(
              id: 'location',
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      CommonTextField(
                        borderRadius: 12,
                        containerHeight: Get.height * 0.07,
                        isSuffixIcon: true,
                        suffixIcon: AssetRes.search,
                        suffixIconSize: 3,
                        hintText: StringRes.search,
                        controller: machineController.searchController,
                        onChanged: (value) {
                          machineController.searchTerm = 'Moonlight';
                          controller.machinesLocationsData.clear();
                          machineController.currentPage = 1;
                          machineController.getMachines(page:  machineController.currentPage, search: value);
                          // machineController.searchResults = machineController.searchAllData(value);
                          print(machineController.searchResults);
                          machineController.update(['location']);
                        },
                      ),
                      controller.machinesLocationsData.isNotEmpty

                      ?Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            controller.machinesLocationsData.clear();
                            machineController.currentPage = 1;
                            await controller.getMachines(page: machineController.currentPage );
                            controller.update(['location']);
                          },
                          child: ListView.builder(
                            controller: controller.scrollController,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: controller.machinesLocationsData.length,
                            itemBuilder: (context, index) {
                              var locationData = controller.machinesLocationsData.keys.toList()[index];
                              var machines = controller.machinesLocationsData[locationData]!;

                              List<Widget> widgets = [];
                              for (var machine in machines) {
                                widgets.add(
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const SizedBox(height: 10),
                                                        Text(
                                                          locationData,
                                                          style: title(),
                                                        ),
                                                        const SizedBox(height: 5),
                                                        SizedBox(
                                                          width: Get.width * 0.24,
                                                          child: Text(
                                                            '${machine.employees?[0].firstname} ${machine.employees?[0].lastname}',
                                                            overflow: TextOverflow.ellipsis,
                                                            style: subTitle(),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 5),
                                                        Text('SN: ${machine.machineNumber ?? ""}-${machine.serialNumber ?? ""}'),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        SizedBox(
                                                          height: Get.height * 0.02,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 6),
                                                          child: SizedBox(
                                                            height: Get.height * 0.05,
                                                            child: DropDownMenu(),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: Get.height * 0.015,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Initial:${machine.initialNumber ?? ""}',
                                                              style: GoogleFonts.nunito(
                                                                fontSize: Get.width * 0.03,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.color030229,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 6,
                                                            ),
                                                            Text(
                                                              'Current: ${machine.currentNumber ?? ""}',
                                                              style: GoogleFonts.nunito(
                                                                fontSize: Get.width * 0.03,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.color030229,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 6,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: Get.height * 0.04,
                                            width: Get.width * 0.2,
                                            margin: EdgeInsets.only(top: 10),
                                            decoration: BoxDecoration(
                                              color: machine.activeMachineStatus == "Active"
                                                  ? ColorRes.green.withOpacity(0.10)
                                                  : machine.activeMachineStatus == "In Service"
                                                  ? ColorRes.yellow
                                                  : ColorRes.red.withOpacity(0.10),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: Text(
                                                machine.activeMachineStatus ?? "",
                                                style: TextStyle(
                                                  color: machine.activeMachineStatus == "Active"
                                                      ? ColorRes.green
                                                      : machine.activeMachineStatus == "In Service"
                                                      ? ColorRes.yellow
                                                      : ColorRes.red.withOpacity(0.10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return Column(
                                children: widgets,
                              );
                            },
                          ),
                        ),
                      )


                          : Obx(
                          ()=> controller.loader.value == false? Padding(padding: EdgeInsets.symmetric(vertical: 30), child: Text(
                        StringRes.notFound,
                        style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      ):SizedBox(),
                          ),

                    ],
                  ),
                );
              },
            ),
            Obx(()=> machineController.loader.value ? const Center(child: CircularProgressIndicator(),):SizedBox())
          ],
        ));
  }
}
