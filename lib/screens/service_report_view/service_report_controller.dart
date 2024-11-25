import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/get_service_report_api/get_service_report_api.dart';
import 'package:route_runner/api_call/get_service_report_api/get_service_report_model.dart';
import 'package:route_runner/model/location_model.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:http/http.dart' as http;
import 'package:route_runner/utils/pref_keys.dart';

import '../../utils/color_res.dart';

class ServiceReportController extends GetxController {
  //--------------checkbox----------
  bool isClick = false;
  //---------------drop down-------------
  bool onClick = false;

  //---old
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();

  List<Location>? filteredLocations = [];
  LocationModel? locationModel;
  @override
  Future<void> onInit() async {
    locationApi(Get.context!);
    await getServiceReport(page: currentPage);
    scrollController.addListener(() {
      upcomingPagination();
    });
    //debugPrint("$locationModel");
    super.onInit();
  }

  String searchTerm = 'Moonlight'; // Change this to your desired search term
  List<allData> searchResults = [];

  List<allData> searchServiceReportData(List<allData> data, String query) {
    query = query.toLowerCase();
    return data
        .where((item) =>
            item.title.toLowerCase().contains(query) ||
            item.subtitle.toLowerCase().contains(query) ||
            item.subtitle1.toLowerCase().contains(query))
        .toList();
  }

  void clickableContainer() {
    isClick = !isClick;
    update(['service']);
  }


  Widget customCheckbox() {
    return GestureDetector(
        onTap: () {
          clickableContainer();
        },
        child: isClick
            ? Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorRes.mainColor),
                    color: ColorRes.mainColor,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: const Icon(
                  size: 14,
                  Icons.check,
                  color: Colors.white,
                ),
              )
            : Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
              ));
  }

  TextEditingController searchController = TextEditingController();
  void filterLocations(String query) {
    query = query.toLowerCase();
    filteredLocations = locationModel!.locations!.where((location) {
      return location.locationname!.toLowerCase().contains(query);
    }).toList();
    update();
  }

  GetServiceReportModel getServiceReportModel= GetServiceReportModel();
  //List<LocationData> locationsData = [];



  int currentPage = 1;
  int limitPerPage = 10;


  getServiceReport({page, search}) async {
    loader.value = true;
    getServiceReportModel = await CustomerGetServiceReportApi.customerGetServiceReportApi(
      page: page,
      limit: limitPerPage,
      search: search,
    );

    if (getServiceReportModel.serviceReports != null && getServiceReportModel.serviceReports!.isNotEmpty) {
      // Remove duplicates before adding new service reports
      Set<String?> existingIds = repairServiceReportData.map((report) => report.sId).toSet();
      List<ServiceReports> newReports = getServiceReportModel.serviceReports!
          .where((report) => !existingIds.contains(report.sId))
          .toList();

      // Add the new service reports to repairServiceReportData
      repairServiceReportData.addAll(newReports);

      print("=======================================$getServiceReportModel");
    }

    update(['service']);
    loader.value = false;
  }



  List<ServiceReports> repairServiceReportData = [];

  // upcomingPagination() async {
  //   if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
  //     if (loader.value != true) {
  //       currentPage++;
  //       await getServiceReport(page: currentPage);
  //     }
  //   }
  //   update(['service']);
  // }
  upcomingPagination() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (loader.value != true) {
        // Add a check for more pages before making the API call
        if (getServiceReportModel.currentPage != null &&
            getServiceReportModel.totalPages != null &&
            getServiceReportModel.currentPage! < getServiceReportModel.totalPages!) {
          currentPage++;
          await getServiceReport(page: currentPage);
        }
      }
    }
    update(['service']);
  }

  // upcomingPagination() async {
  //   if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
  //     if (loader.value != true) {
  //       // Add null checks before using currentPage and totalPages
  //       if (
  //       getRepairsModel.currentPage != null &&
  //           getRepairsModel.totalPages != null &&
  //           getRepairsModel.currentPage! < getRepairsModel.totalPages!) {
  //         currentPage++;
  //         await getRepair(page: currentPage);
  //       }
  //     }
  //   }
  //   update(['location']);
  // }


  locationApi(BuildContext context) async {
    loader.value = true;
    try {
      http.Response? response = await HttpService.getApi(
          url: "http://192.168.29.98:5050/api/location/${PrefService.getString(PrefKeys.loginId)}",
          header: {
            "Content-Type": "application/json",
            'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}"
          });
      if (response != null && response.statusCode == 200) {
        loader.value = false;
        locationModel = locationModelFromJson(response.body);
        filteredLocations = locationModel!.locations;
        update();
      } else {
        loader.value = false;
      }
    } catch (e) {
      loader.value = false;

      return [];
    }
  }
}

class allData {
  final String title;
  final String subtitle;
  final String subtitle1;

  allData(this.title, this.subtitle, this.subtitle1);
}

List<allData> serviceReportData = [
  allData('SN: #1-654125', 'Employee: Steven', 'Issue: Joy stick not working'),
  allData('SN: #2-654184', 'Employee: Elizabeth', 'Issue: Joy stick not working'),
  allData('SN: #3-654199', 'Employee: Grace Hughey', 'Issue: Joy stick not working'),
  allData('SN: #4-654204', 'Employee: Robert Brown', 'Issue: Joy stick not working'),
  allData('SN: #6-654221', 'Employee: Alice Vincent', 'Issue: Joy stick not working`'),
  allData('SN: #7-654228', 'Employee: Kathie Russell', 'Issue: Joy stick not working'),
];
