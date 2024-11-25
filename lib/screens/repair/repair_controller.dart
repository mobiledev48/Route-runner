import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/get_repairs_api/get_repairs_api.dart';
import 'package:route_runner/api_call/get_repairs_api/get_repairs_model.dart';
import 'package:route_runner/utils/color_res.dart';

class RepairController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();
  String searchTerm = 'Moonlight'; // Change this to your desired search term
  List<allData> searchResults = [];
  List<allData> searchAllData(String query) {
    query = query.toLowerCase();
    return repairAllData.where((allData) {
      return allData.title.toLowerCase().contains(query) ||
          allData.subtitle.toLowerCase().contains(query) ||
          allData.active.toLowerCase().contains(query);
    }).toList();
}

  GetRepairsModel getRepairsModel= GetRepairsModel();
  //List<LocationData> locationsData = [];



  @override
  Future<void> onInit() async {
    await getRepair(page: currentPage);
    scrollController.addListener(() {
      upcomingPagination();
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose(); // Assuming 'controller' is your ScrollController
    super.dispose();
  }

  int currentPage = 1;
  int limitPerPage = 10;


  getRepair({page, search}) async {
    loader.value = true;
    getRepairsModel = await CustomerGetRepairsApi.customerGetRepairsApi(
      page: page,
      limit: limitPerPage,
      search: search,
    );

    if (getRepairsModel.data != null && getRepairsModel.data!.isNotEmpty) {
      // Remove duplicates before adding new repair reports
      Set<String?> existingIds = repairReportData.map((report) => report.id).toSet();
      List<Datum> newReports = getRepairsModel.data!
          .where((report) => !existingIds.contains(report.id))
          .toList();

      // Add the new repair reports to repairReportData
      repairReportData.addAll(newReports);

      print("=======================================$getRepairsModel");
    }

    update(['location']);
    loader.value = false;
  }


  List<Datum> repairReportData = [];
  // upcomingPagination() async {
  //   if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
  //     if (loader.value != true) {
  //       currentPage++;
  //       await getRepair(page: currentPage);
  //     }
  //   }
  //   update(['location']);
  // }
  upcomingPagination() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (loader.value != true) {
        // Add null checks before using currentPage and totalPages

          currentPage++;
          await getRepair(page: currentPage);

      }
    }
    update(['location']);
  }




}

class allData {
  final String title;
  final String subtitle;
  final String active;
  final Color color;
  final Color iconColor;
  allData(this.title, this.subtitle, this.active, this.color, this.iconColor);
}

List<allData> repairAllData = [
  allData(
    'Moonlight Bar',
    'Reporter: Arrora gaur',
    'Done',
    ColorRes.color3A974C.withOpacity(0.10),
    ColorRes.color3A974C,
  ),
  allData(
      'Black Sleep Bar', 'Reporter: Steven', 'Pending', ColorRes.colorF29339.withOpacity(0.10), ColorRes.colorF29339),
  allData('Haven Martini', 'Reporter: Trevor Yowell', 'Running', ColorRes.color5B93FF.withOpacity(0.10),
      ColorRes.color5B93FF),
  allData(
      'Refined Mixers', 'Reporter: Grace Hughey', 'Done', ColorRes.color3A974C.withOpacity(0.10), ColorRes.color3A974C),
  allData(
      'Refined Mixers', 'Reporter: Grace Hughey', 'Done', ColorRes.color3A974C.withOpacity(0.10), ColorRes.color3A974C),
  allData('Haven Martini', 'Reporter: Steven', 'Pending', ColorRes.colorF29339.withOpacity(0.10), ColorRes.colorF29339),
  allData('Haven Martini', 'Reporter: Steven', 'Pending', ColorRes.colorF29339.withOpacity(0.10), ColorRes.colorF29339),
  allData('Haven Martini', 'Reporter: Steven', 'Pending', ColorRes.colorF29339.withOpacity(0.10), ColorRes.colorF29339),
  allData('Black Sleep Bar', 'Reporter: Alice Vincent', 'Running', ColorRes.color5B93FF.withOpacity(0.10),
      ColorRes.color5B93FF),
];
