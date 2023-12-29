import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/model/location_model.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:http/http.dart' as http;
import 'package:route_runner/utils/pref_keys.dart';

import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/text_style.dart';

class LocationController extends GetxController {
  //--------------checkbox----------

  //---------------drop down-------------
  bool onClick = false;

  //---old
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();

  List<Location>? filteredLocations = [];
  LocationModel? locationModel;
  @override
  void onInit() {
    locationApi(Get.context!);
    //debugPrint("$locationModel");

    super.onInit();
  }

  String searchTerm = 'Moonlight'; // Change this to your desired search term
  List<allData> searchResults = [];
  List<allData> searchAllData(String query) {
    query = query.toLowerCase();
    return locationAllData.where((allData) {
      return allData.title.toLowerCase().contains(query) ||
          allData.subtitle.toLowerCase().contains(query) ||
          allData.active.toLowerCase().contains(query);
    }).toList();
  }

  int currentIndex = 0;

  void nextPage(index) {
    currentIndex = index;
    update(['location']);
  }

  TextEditingController searchController = TextEditingController();
  void filterLocations(String query) {
    query = query.toLowerCase();
    filteredLocations = locationModel!.locations!.where((location) {
      return location.locationname!.toLowerCase().contains(query);
    }).toList();
    update();
  }

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
  final String active;
  final Color color;
  final Color iconColor;
  allData(this.title, this.subtitle, this.active, this.color, this.iconColor);
}

List<allData> locationAllData = [
  allData(
    'Moonlight Bar',
    'Admin: Arrora gaur',
    'Active',
    ColorRes.green.withOpacity(0.10),
    ColorRes.green,
  ),
  allData('Black Sleep Bar', 'Admin: Edward Evan', 'Pending', ColorRes.lightYellow, ColorRes.yellow),
  allData(
    'Haven Martini',
    'Admin: Bethany Jackson',
    'Active',
    ColorRes.lightGreen,
    ColorRes.green,
  ),
  allData(
    'Refined Mixers',
    'Admin: Arrora gaur',
    'Closed',
    ColorRes.lightPink,
    ColorRes.pink,
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

// class allData {
//   final String title;
//   final String subtitle;
//   final Color color;
//   final Color iconColor;
//   final String text;
//   allData(this.title, this.subtitle, this.color, this.iconColor, this.text);
// }
//
// List<allData> _allData = [
//   allData('Moonlight Bar', 'Admin: Arrora gaur', ColorRes.lightGreen, ColorRes.green, 'Active'),
//   allData('Black Sleep Bar', 'Admin: Edward Evan', ColorRes.lightGreen, ColorRes.green, 'Active'),
//   allData('Haven Martini', 'Admin: Bethany Jackson', ColorRes.lightYellow, ColorRes.yellow, 'Pending'),
//   allData('Refined Mixers', 'Admin: Arrora gaur', ColorRes.lightPink, ColorRes.pink, 'Closed'),
//   allData('Haven Martini', 'Admin: Edward Evan', ColorRes.lightGreen, ColorRes.green, 'Active'),
//   allData('Black Sleep Bar', 'Admin: Arrora gaur', ColorRes.lightPink, ColorRes.pink, 'Closed'),
// ];
