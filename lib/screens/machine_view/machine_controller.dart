import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/get_machine_api/get_machine_api.dart';
import 'package:route_runner/api_call/get_machine_api/get_machine_model.dart';
import 'package:route_runner/utils/color_res.dart';


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

  Map<String, List<Machine>> machinesLocationsData = {};


  getMachines({page, search}) async {
    loader.value = true;
    getMachinesModel = await CustomerGetMachineApi.customerGetMachineApi(page: page, limit: limitPerPage, search: search);

    if (getMachinesModel.locations != null && getMachinesModel.locations!.isNotEmpty) {
      currentPage++;

      for (int i = 0; i < getMachinesModel.locations!.length; i++) {
        var locationData = getMachinesModel.locations![i];

        List<Machine> locationMachines = [];
        for (int j = 0; j < locationData.machines!.length; j++) {
          var machineData = locationData.machines![j];
          Machine machine = Machine(
            initialNumber: machineData.initialNumber ?? "",
            currentNumber: machineData.currentNumber ?? "",
            id: machineData.id ?? "",
            machineNumber: machineData.machineNumber ?? "",
            serialNumber: machineData.serialNumber ?? "",
            activeMachineStatus: machineData.activeMachineStatus ?? "",
            employees: machineData.employees ?? [],
            createdAt: machineData.createdAt,
            updatedAt: machineData.updatedAt,
            v: machineData.v,
          );

          // Check if the machine with the same ID already exists in the list
          bool machineExists = machinesLocationsData.values
              .expand((machines) => machines)
              .any((existingMachine) => existingMachine.id == machine.id);

          // If the machine doesn't exist, add it to the list
          if (!machineExists) {
            locationMachines.add(machine);
          }
        }

        // Check if location name already exists in the map
        if (machinesLocationsData.containsKey(locationData.locationname)) {
          // If yes, add the machines to the existing list
          machinesLocationsData[locationData.locationname]!.addAll(locationMachines);
        } else {
          // If no, create a new entry with the location name and machines
          machinesLocationsData[locationData.locationname ?? ""] = locationMachines;
        }
      }

      // Print the data for debugging or logging purposes
      for (var entry in machinesLocationsData.entries) {
        print("Location Name: ${entry.key}");
        for (var machine in entry.value) {
          print("Machine Number: ${machine.machineNumber}, Serial Number: ${machine.serialNumber}");
        }
      }
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
  // upcomingPagination() async {
  //   if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
  //       loader.value != true) {
  //     // Add a check for more pages before making the API call
  //     if (getMachinesModel.currentPage! < getMachinesModel.totalLocationPages!) {
  //       await getMachines(page: getMachinesModel.currentPage! + 1);
  //     }
  //   }
  //   update(['location']);
  // }






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
