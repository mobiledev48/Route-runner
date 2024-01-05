import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/utils/color_res.dart';

class RepairController extends GetxController {
  TextEditingController searchController = TextEditingController();

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
