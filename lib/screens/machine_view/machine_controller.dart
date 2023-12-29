import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:route_runner/utils/color_res.dart';

import '../collection_report/collection_report_controller.dart';

class MachineController extends GetxController {

  TextEditingController searchController = TextEditingController();

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

}

class allData {
  final String title;
  final String subtitle;
  final String active;
  final Color color;
  final Color iconColor;
  allData(this.title, this.subtitle, this.active,this.color, this.iconColor);
}

List<allData> machineAllData = [
  allData(
    'Moonlight Bar',
    'Admin: Arrora gaur',
    'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,
  ),
  allData('Black Sleep Bar', 'Admin: Edward Evan','In Service', ColorRes.colorF29339.withOpacity(0.10), ColorRes.colorF29339),
  allData('Haven Martini', 'Admin: Bethany Jackson', 'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,),
  allData('Refined Mixers', 'Admin: Arrora gaur', 'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,),
  allData('Haven Martini', 'Admin: Edward Evan',  'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,),
  allData('Black Sleep Bar', 'Admin: Arrora gaur', 'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,),
];

