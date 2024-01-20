import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/get_machine_api/get_machine_api.dart';
import 'package:route_runner/api_call/get_machine_api/get_machine_model.dart';
import 'package:route_runner/utils/color_res.dart';

import '../collection_report/collection_report_controller.dart';

class MachineController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();
  String searchTerm = 'Moonlight'; // Change this to your desired search term
  List<allData> searchResults = [];
  List<allData> searchAllData(String query) {
  query = query.toLowerCase();
    return machineAllData.where((allData) {
      return allData.title.toLowerCase().contains(query) ||
          allData.subtitle.toLowerCase().contains(query) ||
          allData.active.toLowerCase().contains(query);
    }).toList();
  }

  int currentPage = 1;
  int limitPerPage = 10;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    // getMachines();

    await getMachines(page: currentPage);
    scrollController.addListener(() {
      upcomingPagination();
    });
  }


  GetMachinesModel getMachinesModel= GetMachinesModel();
  //List<LocationData> locationsData = [];
  List<Location> machinesLocationsData = [];
  // List machinesLocationsData = [];
  getMachines({page,search})
  async {
    loader.value = true;
    getMachinesModel = await CustomerGetMachineApi.customerGetMachineApi(page: page,limit: limitPerPage,search: search);
    if (getMachinesModel.locations != null && getMachinesModel.locations!.isNotEmpty) {
      currentPage++;

      for (int i = 0; i < getMachinesModel.locations!.length; i++) {
        machinesLocationsData.addAll(getMachinesModel.locations ?? []);

        // print("-------------------------------${machinesLocationsData[0].machines?[0].employees?[0].firstname}");
        print("=======================================${machinesLocationsData}");
      }
      machinesLocationsData.toSet().toList();
    }
      update(['location']);
    loader.value = false;
  }


  upcomingPagination() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (loader.value != true) {
        await getMachines(page: currentPage);
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

List<allData> machineAllData = [
  allData(
    'Moonlight Bar',
    'Admin: Arrora gaur',
    'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,
  ),
  allData('Black Sleep Bar', 'Admin: Edward Evan', 'In Service', ColorRes.colorF29339.withOpacity(0.10),
      ColorRes.colorF29339),
  allData(
    'Haven Martini',
    'Admin: Bethany Jackson',
    'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,
  ),
  allData(
    'Refined Mixers',
    'Admin: Arrora gaur',
    'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,
  ),
  allData(
    'Haven Martini',
    'Admin: Edward Evan',
    'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,
  ),
  allData(
    'Black Sleep Bar',
    'Admin: Arrora gaur',
    'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,
  ),
];
