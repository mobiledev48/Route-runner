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
  void onInit() {
    locationApi(Get.context!);
    //debugPrint("$locationModel");
    super.onInit();
  }
  String searchTerm = 'Moonlight'; // Change this to your desired search term
  List<allData> searchResults = [];

  List<allData> searchServiceReportData(List<allData> data, String query) {
    query = query.toLowerCase();
    return data.where((item) =>
    item.title.toLowerCase().contains(query) ||
        item.subtitle.toLowerCase().contains(query) ||
        item.subtitle1.toLowerCase().contains(query)).toList();
  }

  void clickableContainer() {
    isClick = !isClick;
    update(['location']);
  }

  Widget customDropDown() {
    return Container(
      height: Get.height * 0.13,
      width: Get.width * 0.4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: ColorRes.lightBlue),
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: ColorRes.lightYellow),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  AssetRes.pin,
                  scale: 3,
                ),
                Text(
                  'Change Status',
                  style: commonSubtitle(),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: ColorRes.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  AssetRes.list,
                  scale: 3,
                ),
                Text(
                  'List of machine',
                  style: commonSubtitle(),
                )
              ],
            ),
          )
        ],
      ),
    );
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
                child: Icon(
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
                    borderRadius: BorderRadius.all(Radius.circular(5))),
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


  allData(this.title, this.subtitle,this.subtitle1);
}

List<allData> serviceReportData = [
  allData(
      'SN: #1-654125',
      'Employee: Steven',
      'Issue: Joy stick not working'
  ),
  allData('SN: #2-654184', 'Employee: Elizabeth','Issue: Joy stick not working'),
  allData('SN: #3-654199', 'Employee: Grace Hughey', 'Issue: Joy stick not working'),
  allData('SN: #4-654204', 'Employee: Robert Brown', 'Issue: Joy stick not working'),
  allData('SN: #6-654221', 'Employee: Alice Vincent', 'Issue: Joy stick not working`'),
  allData('SN: #7-654228', 'Employee: Kathie Russell', 'Issue: Joy stick not working'),
];

