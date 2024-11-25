import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/get_collection_report_api/get_collection_report_model.dart';
import 'package:route_runner/api_call/get_location_api/get_location_api.dart';
import 'package:route_runner/api_call/get_location_api/get_location_model.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/pref_keys.dart';

import '../../utils/color_res.dart';

class CollectionReportController extends GetxController {
  // bool onClick = false;

  List<bool> onClick = [];
  List<bool> isClick = [];
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  void nextPage(index) {
    onClick = index;
    update(['collection']);
  }


  @override
  Future<void> onInit() async {
    isViewData = List.generate(allCollectionData.length, (index) => false);
    isClick = List.generate(allCollectionData.length, (index) => false);
    await getLocation(page: currentPage);
    scrollController.addListener(() {
      upcomingPagination();
    });
    super.onInit();
  }

  int currentPage = 1;
  int limitPerPage = 10;
  List firstName =[];
  List  lastName =[];

  GetCollectionReportModel getCollectionReportModel = GetCollectionReportModel();
  GetLocationModel getLocationModel= GetLocationModel();
  List<LocationsData> locationsData = [];
  getLocation({page, search}) async {
    loader.value = true;
    getLocationModel = await CustomerGetLocationApi.customerGetLocationApi(page: page, search: search);

    if (getLocationModel.locations != null && getLocationModel.locations!.isNotEmpty) {
      // Remove duplicates before adding new locations
      Set<String?> existingIds = locationsData.map((location) => location.id).toSet();
      List<LocationsData> newLocations = getLocationModel.locations!
          .where((location) => !existingIds.contains(location.id))
          .toList();

      locationsData.addAll(newLocations);
      firstName = List.generate(locationsData.length, (index) => '');
      lastName = List.generate(locationsData.length, (index) => '');

      for (var element in locationsData) {
        if(element.employees!=null){
        for (var e in element.employees!) {
      if(PrefService.getString(PrefKeys.firstName) == e.firstname &&PrefService.getString(PrefKeys.lastName) == e.lastname)
        {
          firstName[locationsData.indexOf(element)] = e.firstname ?? '';
          lastName[locationsData.indexOf(element)] = e.lastname ?? '';
        }

        }
        }
      }

      update(['collection']);
    }

    loader.value = false;
  }
 /* getCollectionReport({page, search}) async {
    loader.value = true;
    getCollectionReportModel = await CustomerGetCollectionReportApi.customerGetCollectionReportApi(
      page: page,
      limit: limitPerPage,
      search: search,

    );

    if (getCollectionReportModel.groupedReports != null && getCollectionReportModel.groupedReports!.isNotEmpty) {
      // Remove duplicates before adding new reports
      // Set<String?> existingIds = collectionReportData.map((report) => report.location?.id).toSet();
      //
      // // Filter out existing reports
      // List<GroupedReports> newReports = getCollectionReportModel.groupedReports!
      //     .where((report) => !existingIds.contains(report.location?.id))
      //     .toList();


      // Add the new reports to collectionReportData
      collectionReportData =getCollectionReportModel.groupedReports ??[] ;
      isViewData = List.generate(collectionReportData.length, (index) => false);
      isClick = List.generate(collectionReportData.length, (index) => false);

      print("=======================================${getCollectionReportModel}");
    }

    update(['collection']);
    loader.value = false;
  }*/

 // List<GroupedReports> collectionReportData = [];

  upcomingPagination() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (loader.value != true) {
        currentPage++;
        await getLocation(page: currentPage);
      }
    }
    update(['location']);
  }



  List<bool> isViewData = [];



  String searchTerm = 'Moonlight'; // Change this to your desired search term
  List<allData> searchResults = [];
  List<allData> searchAllData(List<allData> data, String query) {
    query = query.toLowerCase();
    return data
        .where((item) =>
            item.title?.toLowerCase().contains(query) == true ||
            item.employeeName?.toLowerCase().contains(query) == true ||
            item.address?.toLowerCase().contains(query) == true)
        .toList();
  }

  Widget customCheckbox(int index) {
    return GestureDetector(
        onTap: () {
          isClick[index] = !isClick[index];
          update(['collection']);
        },
        child: isClick[index]
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

  num calculateTotalValue(num? In, num? out) {
    num total = (In ?? 0) + (out ?? 0);
    return total;
  }

  num calculateTotal(num? In, num? out) {
    num total = (In ?? 0) + (out ?? 0);
    return total;
  }

  num calculateSubtractedValue(num? In, num? out) {
    num total = (In ?? 0) - (out ?? 0);
    return total;
  }

  String calculateAndFormatValue(int index, int i) {
    final currentValueIn = allCollectionData[index].machineDetails?[i].current?[0].In ?? 0;
    final previousValueIn = allCollectionData[index].machineDetails?[i].previous?[0].In ?? 0;
    final currentValueOut = allCollectionData[index].machineDetails?[i].current?[0].out ?? 0;
    final previousValueOut = allCollectionData[index].machineDetails?[i].previous?[0].out ?? 0;

    final netValue = calculateSubtractedValue(
      calculateSubtractedValue(currentValueIn, previousValueIn),
      calculateSubtractedValue(currentValueOut, previousValueOut),
    );

    // Format the netValue as currency (e.g., 2 decimal places)
    return '$netValue';
  }

  Color getTextColor(int index, int i) {
    final currentValueIn = allCollectionData[index].machineDetails?[i].current?[0].In ?? 0;
    final previousValueIn = allCollectionData[index].machineDetails?[i].previous?[0].In ?? 0;
    final currentValueOut = allCollectionData[index].machineDetails?[i].current?[0].out ?? 0;
    final previousValueOut = allCollectionData[index].machineDetails?[i].previous?[0].out ?? 0;

    final netValue = calculateSubtractedValue(
      calculateSubtractedValue(currentValueIn, previousValueIn),
      calculateSubtractedValue(currentValueOut, previousValueOut),
    );
    print("netValue---->$netValue");

    // Set text color based on netValue
    return (netValue >= 0) ? ColorRes.color3A974C : Colors.red;
  }


  List<allData> allCollectionData = [
    allData(
      title: 'Moonlight Bar',
      employeeName: 'Arrora gaur',
      address: "4617 Briercliff Road, New York, NY 10011",
      machineDetails: [
        MachineDetails(
          machineId: 1,
          current: [
            Current(In: 10, out: 5),
            Current(In: 8, out: 3),
          ],
          previous: [
            Current(In: 15, out: 7),
            Current(In: 12, out: 4),
          ],
        ),
        MachineDetails(
          machineId: 2,
          current: [
            Current(In: 20, out: 10),
            Current(In: 28, out: 31),
          ],
          previous: [
            Current(In: 15, out: 9),
            Current(In: 13, out: 4),
          ],
        ),
        MachineDetails(
          machineId: 3,
          current: [
            Current(In: 10, out: 5),
            Current(In: 8, out: 3),
          ],
          previous: [
            Current(In: 15, out: 7),
            Current(In: 12, out: 4),
          ],
        ),
      ],
    ),
    allData(
      title: 'Black Sleep Bar',
      employeeName: 'Trevor Yowell',
      address: "4617 Briercliff Road, New York, NY 10011",
      machineDetails: [
        MachineDetails(
          machineId: 1,
          current: [
            Current(In: 10, out: 5),
          ],
          previous: [
            Current(In: 5, out: 5),
          ],
        ),
        MachineDetails(
          machineId: 2,
          current: [
            Current(In: 20, out: 10),
          ],
          previous: [
            Current(In: 15, out: 9),
          ],
        ),
      ],
    ),
    allData(
      title: 'Moonlight Bar',
      employeeName: 'Arrora gaur',
      address: "4617 Briercliff Road, New York, NY 10011",
      machineDetails: [
        MachineDetails(
          machineId: 1,
          current: [
            Current(In: 10, out: 5),
            Current(In: 8, out: 3),
          ],
          previous: [
            Current(In: 15, out: 7),
            Current(In: 12, out: 4),
          ],
        ),
        MachineDetails(
          machineId: 2,
          current: [
            Current(In: 20, out: 10),
            Current(In: 28, out: 31),
          ],
          previous: [
            Current(In: 15, out: 9),
            Current(In: 13, out: 4),
          ],
        ),
        MachineDetails(
          machineId: 3,
          current: [
            Current(In: 10, out: 5),
            Current(In: 8, out: 3),
          ],
          previous: [
            Current(In: 15, out: 7),
            Current(In: 12, out: 4),
          ],
        ),
        MachineDetails(
          machineId: 3,
          current: [
            Current(In: 10, out: 5),
            Current(In: 8, out: 3),
          ],
          previous: [
            Current(In: 15, out: 7),
            Current(In: 12, out: 4),
          ],
        ),
      ],
    ),
    allData(
      title: 'Black Sleep Bar',
      employeeName: 'Trevor Yowell',
      address: "4617 Briercliff Road, New York, NY 10011",
      machineDetails: [
        MachineDetails(
          machineId: 2,
          current: [
            Current(In: 20, out: 10),
            Current(In: 28, out: 31),
          ],
          previous: [
            Current(In: 15, out: 9),
            Current(In: 13, out: 4),
          ],
        ),
        MachineDetails(
          machineId: 3,
          current: [
            Current(In: 10, out: 5),
            Current(In: 8, out: 3),
          ],
          previous: [
            Current(In: 15, out: 7),
            Current(In: 12, out: 4),
          ],
        ),
        MachineDetails(
          machineId: 1,
          current: [
            Current(In: 10, out: 5),
          ],
          previous: [
            Current(In: 5, out: 5),
          ],
        ),
        MachineDetails(
          machineId: 2,
          current: [
            Current(In: 20, out: 10),
          ],
          previous: [
            Current(In: 15, out: 9),
          ],
        ),
      ],
    ),
  ];
}


class allData {
  String? title;
  String? employeeName;
  String? address;
  List<MachineDetails>? machineDetails;
  int? machine;
  // Adjust the constructor to compute the machine length based on machineDetails
  allData({this.title, this.employeeName, this.machineDetails, this.machine, this.address}) {
    machine = machineDetails?.length ?? 0;
  }
}

class MachineDetails {
  int? machineId;
  List<Current>? current;
  List<Current>? previous;

  MachineDetails({this.machineId, this.current, this.previous});
}

class Current {
  num? In;
  num? out;

  Current({this.In, this.out});
}
