import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/api_call/get_location_api/get_location_api.dart';
import 'package:route_runner/api_call/get_location_api/get_location_model.dart';
import 'package:route_runner/model/location_model.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:http/http.dart' as http;
import 'package:route_runner/utils/pref_keys.dart';

import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';

class LocationController extends GetxController {
  //--------------checkbox----------

  //---------------drop down-------------
  bool onClick = false;

  //---old
  RxBool loader = false.obs;
  ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int limitPerPage = 10;
  List<Location>? filteredLocations = [];
  LocationModel? locationModel;
  @override
  Future<void> onInit() async {
    locationApi(Get.context!);
    //debugPrint("$locationModel");
    await getLocation(page: currentPage);
    scrollController.addListener(() {
      upcomingPagination();
    });
    super.onInit();
  }

  GetLocationModel getLocationModel= GetLocationModel();
  List<LocationsData> locationsData = [];
  getLocation({page, search}) async {
    loader.value = true;
    getLocationModel = await CustomerGetLocationApi.customerGetLocationApi(page: page, search: search);

    if (getLocationModel.locations != null && getLocationModel.locations!.isNotEmpty) {
      // Remove duplicates before adding new locations
      Set<String?> existingIds = locationsData.map((location) => location.sId).toSet();
      List<LocationsData> newLocations = getLocationModel.locations!
          .where((location) => !existingIds.contains(location.sId))
          .toList();

      locationsData.addAll(newLocations);
      update(['location']);
    }

    loader.value = false;
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

  // upcomingPagination() async {
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     if (loader.value != true) {
  //       await getLocation(page: currentPage);
  //     }
  //   }
  //   update(['location']);
  // }

  // upcomingPagination() async {
  //   if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
  //     if (loader.value != true) {
  //       currentPage++;
  //       await getLocation(page: currentPage);
  //     }
  //   }
  //   update(['location']);
  // }

  upcomingPagination() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (loader.value != true) {
        // Add a check for more pages before making the API call
        if (getLocationModel != null &&
            getLocationModel.currentPage != null &&
            getLocationModel.totalPages != null &&
            getLocationModel.currentPage! < getLocationModel.totalPages!) {
          currentPage++;
          await getLocation(page: currentPage);
        }
      }
    }
    update(['collection']);
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

  Widget clickableContainer() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              nextPage(0);
              update(['machine']);
            },
            child: Container(
              height: Get.height * 0.06,
              width: Get.width * 0.455,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                  color: currentIndex == 0 ? ColorRes.mainColor : ColorRes.white),
              child: Center(
                  child: Text(
                StringRes.paid,
                style: TextStyle(color: currentIndex == 0 ? ColorRes.white : ColorRes.black),
              )),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              nextPage(1);
              update(['machine']);
            },
            child: Container(
              height: Get.height * 0.06,
              width: Get.width * 0.455,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
                  color: currentIndex == 1 ? ColorRes.mainColor : ColorRes.white),
              child: Center(
                  child: Text(StringRes.unPaid,
                      style: TextStyle(color: currentIndex == 1 ? ColorRes.white : ColorRes.black))),
            ),
          ),
        ),
      ],
    );
  }
}

class allData {
  final String title;
  final String subtitle;
  final String active;
  final Color color;
  final Color iconColor;
  final Color textColor;
  allData(this.title, this.subtitle, this.active, this.color, this.iconColor, this.textColor);
}

List<allData> locationAllData = [
  allData(
    'Moonlight Bar',
    'Admin: Arrora gaur',
    'Active',
    Colors.green.withOpacity(0.10),
    ColorRes.green,
    ColorRes.green,
  ),
  allData('Black Sleep Bar', 'Admin: Edward Evan', 'Pending', Colors.orange.withOpacity(0.10), ColorRes.orange,
      ColorRes.yellow),
  allData(
    'Haven Martini',
    'Admin: Bethany Jackson',
    'Active',
    Colors.green.withOpacity(0.10),
    ColorRes.green,
    ColorRes.green,
  ),
  allData(
    'Refined Mixers',
    'Admin: Arrora gaur',
    'Closed',
    Colors.pink.withOpacity(0.10),
    ColorRes.pink,
    ColorRes.pink,
  ),
  allData(
    'Haven Martini',
    'Admin: Edward Evan',
    'Active',
    Colors.green.withOpacity(0.10),
    ColorRes.green,
    ColorRes.green,
  ),
  allData(
    'Black Sleep Bar',
    'Admin: Arrora gaur',
    'Active',
    Colors.green.withOpacity(0.10),
    ColorRes.green,
    ColorRes.green,
  ),
];

// body: GestureDetector(
// onTap: () {
// FocusScope.of(context).unfocus();
// },
// child: GetBuilder<LocationController>(
// id: 'location',
// builder: (controller) {
// return Column(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
// child: Column(
// children: [
// Container(
// margin: const EdgeInsets.only(bottom: 10),
// width: Get.width * 0.9,
// height: Get.height * 0.06,
// child: CommomTextFormFeild(
// controller: locationController.searchController,
// onChanged: (value) {
// locationController.searchTerm = 'Moonlight'; // Change this to your desired search term
// locationController.searchResults = locationController.searchAllData(value);
// print(locationController.searchResults);
// locationController.update(['location']);
// },
// )),
// SizedBox(
// height: 10,
// ),
// Row(
// children: [
// GestureDetector(
// onTap: () {
// controller.nextPage(0);
// controller.update(['machine']);
// },
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.455,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
// color: controller.currentIndex == 0 ? ColorRes.mainColor : ColorRes.white),
// child: Center(
// child: Text(
// StringRes.paid,
// style:
// TextStyle(color: controller.currentIndex == 0 ? ColorRes.white : ColorRes.black),
// )),
// ),
// ),
// GestureDetector(
// onTap: () {
// controller.nextPage(1);
// controller.update(['machine']);
// },
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.455,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
// color: controller.currentIndex == 1 ? ColorRes.mainColor : ColorRes.white),
// child: Center(
// child: Text(StringRes.unPaid,
// style: TextStyle(
// color: controller.currentIndex == 1 ? ColorRes.white : ColorRes.black))),
// ),
// ),
// ],
// ),
// controller.searchResults.isEmpty
// ? SizedBox(
// height: Get.height,
// child: ListView.builder(
// scrollDirection: Axis.vertical,
// // physics: NeverScrollableScrollPhysics(),
// itemCount: locationAllData.length,
// itemBuilder: (context, index) => Padding(
// padding: const EdgeInsets.only(top: 10),
// child: Container(
// height: 75,
// width: Get.width,
// decoration: BoxDecoration(
// color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// // Padding(
// //   padding: const EdgeInsets.only(bottom: 20, left: 5),
// //   child: locationController.customCheckbox(),
// // ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(height: 10),
// Text(
// locationAllData[index].title,
// // 'Moonlight Bar',
// style: GoogleFonts.nunito(
// fontSize: 12,
// fontWeight: FontWeight.w600,
// color: ColorRes.black),
// ),
// SizedBox(height: 5),
// Text(
// locationAllData[index].subtitle,
// // 'Admin: Arrora gaur',
// style: GoogleFonts.nunito(
// fontSize: 9,
// fontWeight: FontWeight.w400,
// color: ColorRes.color030229),
// ),
// SizedBox(height: 5),
// Text(
// 'SN: #${index + 1}-654184',
// style: GoogleFonts.nunito(
// fontSize: 9,
// fontWeight: FontWeight.w400,
// color: ColorRes.color030229),
// )
// ],
// ),
// Container(
// height: Get.height * 0.04,
// width: Get.width * 0.2,
// decoration: BoxDecoration(
// color: locationAllData[index].color,
// borderRadius: BorderRadius.circular(30),
// ),
// child: Center(
// child: Text(
// locationAllData[index].active,
// style: TextStyle(
// color: locationAllData[index].iconColor, fontSize: 12),
// )),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// SizedBox(
// height: Get.height * 0.02,
// ),
// PopupMenuButton(
// offset: const Offset(0, 10),
// // padding: EdgeInsets.zero,
// constraints: BoxConstraints.expand(width: 120, height: 115),
// position: PopupMenuPosition.under,
//
// child: Text(
// "View more",
// style: GoogleFonts.nunito(
// decoration: TextDecoration.underline,
// fontSize: 10,
// fontWeight: FontWeight.w600,
// color: ColorRes.color030229),
// ),
// itemBuilder: (context) {
// return [
// PopupMenuItem(
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.6,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(6),
// color: ColorRes.lightYellow),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset(
// AssetRes.pin,
// scale: 3,
// ),
// Text(
// 'Change Status',
// style: commonSubtitle(),
// )
// ],
// ),
// ),
// ),
// PopupMenuItem(
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.4,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(6),
// color: ColorRes.grey),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset(
// AssetRes.list,
// scale: 3,
// ),
// Text(
// 'List of machine',
// style: commonSubtitle(),
// )
// ],
// ),
// ))
// ];
// },
// ),
// SizedBox(height: Get.height * 0.04),
// Row(
// children: [
// Text(
// 'Initial: \$ 2000',
// style: GoogleFonts.nunito(
// decoration: TextDecoration.underline,
// fontSize: 8,
// fontWeight: FontWeight.w400,
// color: ColorRes.color030229),
// ),
// const SizedBox(
// width: 6,
// ),
// Text(
// 'Current: \$ 2648',
// style: GoogleFonts.nunito(
// decoration: TextDecoration.underline,
// fontSize: 8,
// fontWeight: FontWeight.w400,
// color: ColorRes.color030229),
// )
// ],
// )
// ],
// )
// ],
// )
// ],
// ),
// ),
// )
//
// //     Padding(
// //   padding: const EdgeInsets.all(8.0),
// //   child: Container(
// //     height: 70,
// //     width: Get.width,
// //     decoration:
// //         BoxDecoration(color: ColorRes.lightYellow, borderRadius: BorderRadius.circular(10)),
// //     child: ListTile(
// //       trailing: Column(
// //         children: [TextButton(onPressed: () {}, child: Text('View more'))],
// //       ),
// //       title: Text('Moonlight Bar'),
// //       leading: locationController.customCheckbox(),
// //       subtitle: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.only(right: 0),
// //             child: Text(
// //               'Admin: Arrora gaur',
// //               style: commonSubtitle(),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.only(right: 0),
// //             child: Text(
// //               'Machine: 7',
// //               style: commonSubtitle(),
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   ),
// // ),
// ),
// )
//     : SizedBox(
// height: Get.height,
// child: ListView.builder(
// scrollDirection: Axis.vertical,
// // physics: NeverScrollableScrollPhysics(),
// itemCount: controller.searchResults.length,
// itemBuilder: (context, index) => Padding(
// padding: const EdgeInsets.only(top: 10),
// child: Container(
// height: 75,
// width: Get.width,
// decoration: BoxDecoration(
// color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// // Padding(
// //   padding: const EdgeInsets.only(bottom: 20, left: 5),
// //   child: locationController.customCheckbox(),
// // ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(height: 10),
// Text(
// controller.searchResults[index].title,
// // 'Moonlight Bar',
// style: GoogleFonts.nunito(
// fontSize: 12,
// fontWeight: FontWeight.w600,
// color: ColorRes.black),
// ),
// SizedBox(height: 5),
// Text(
// controller.searchResults[index].subtitle,
// // 'Admin: Arrora gaur',
// style: GoogleFonts.nunito(
// fontSize: 9,
// fontWeight: FontWeight.w400,
// color: ColorRes.color030229),
// ),
// SizedBox(height: 5),
// Text(
// 'SN: #${index + 1}-654184',
// style: GoogleFonts.nunito(
// fontSize: 9,
// fontWeight: FontWeight.w400,
// color: ColorRes.color030229),
// )
// ],
// ),
// Container(
// height: Get.height * 0.04,
// width: Get.width * 0.2,
// decoration: BoxDecoration(
// color: controller.searchResults[index].color,
// borderRadius: BorderRadius.circular(30),
// ),
// child: Center(
// child: Text(
// controller.searchResults[index].active,
// style: TextStyle(
// color: controller.searchResults[index].iconColor,
// fontSize: 12),
// )),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// SizedBox(
// height: Get.height * 0.02,
// ),
// PopupMenuButton(
// offset: const Offset(0, 10),
// // padding: EdgeInsets.zero,
// constraints: BoxConstraints.expand(width: 120, height: 115),
// position: PopupMenuPosition.under,
//
// child: Text(
// "View more",
// style: GoogleFonts.nunito(
// decoration: TextDecoration.underline,
// fontSize: 10,
// fontWeight: FontWeight.w600,
// color: ColorRes.color030229),
// ),
// itemBuilder: (context) {
// return [
// PopupMenuItem(
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.6,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(6),
// color: ColorRes.lightYellow),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset(
// AssetRes.pin,
// scale: 3,
// ),
// Text(
// 'Change Status',
// style: commonSubtitle(),
// )
// ],
// ),
// ),
// ),
// PopupMenuItem(
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.4,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(6),
// color: ColorRes.grey),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset(
// AssetRes.list,
// scale: 3,
// ),
// Text(
// 'List of machine',
// style: commonSubtitle(),
// )
// ],
// ),
// ))
// ];
// },
// ),
// SizedBox(height: Get.height * 0.04),
// Row(
// children: [
// Text(
// 'Initial: \$ 2000',
// style: GoogleFonts.nunito(
// decoration: TextDecoration.underline,
// fontSize: 8,
// fontWeight: FontWeight.w400,
// color: ColorRes.color030229),
// ),
// const SizedBox(
// width: 6,
// ),
// Text(
// 'Current: \$ 2648',
// style: GoogleFonts.nunito(
// decoration: TextDecoration.underline,
// fontSize: 8,
// fontWeight: FontWeight.w400,
// color: ColorRes.color030229),
// )
// ],
// )
// ],
// )
// ],
// )
// ],
// ),
// ),
// )
//
// //     Padding(
// //   padding: const EdgeInsets.all(8.0),
// //   child: Container(
// //     height: 70,
// //     width: Get.width,
// //     decoration:
// //         BoxDecoration(color: ColorRes.lightYellow, borderRadius: BorderRadius.circular(10)),
// //     child: ListTile(
// //       trailing: Column(
// //         children: [TextButton(onPressed: () {}, child: Text('View more'))],
// //       ),
// //       title: Text('Moonlight Bar'),
// //       leading: locationController.customCheckbox(),
// //       subtitle: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.only(right: 0),
// //             child: Text(
// //               'Admin: Arrora gaur',
// //               style: commonSubtitle(),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.only(right: 0),
// //             child: Text(
// //               'Machine: 7',
// //               style: commonSubtitle(),
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   ),
// // ),
// ),
// ),
// ],
// ),
// ),
// ],
// );
// },
// ),
// ));

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

//
// controller.searchController.text.isEmpty
// ? SizedBox(
// height: Get.height,
// child: ListView.builder(
// // scrollDirection: Axis.vertical,
// // physics: NeverScrollableScrollPhysics(),
// itemCount: _allData.length,
// itemBuilder: (context, index) => Padding(
// padding: const EdgeInsets.only(top: 10),
// child: Container(
// height: 75,
// width: Get.width,
// decoration: BoxDecoration(
// color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(height: 10),
// Text(
// _allData[index].title,
// style: commonTitle().copyWith(
// color: ColorRes.black,
// fontWeight: FontWeight.w600,
// fontSize: 13),
// ),
// SizedBox(height: 5),
// SizedBox(
// width: Get.width * 0.26,
// child: Text(
// overflow: TextOverflow.ellipsis,
// _allData[index].subtitle,
// style: commonSubtitle()
//     .copyWith(color: ColorRes.grey, fontSize: 10),
// ),
// ),
// SizedBox(height: 5),
// Text(
// 'Machine: 7',
// style: commonSubtitle().copyWith(color: ColorRes.grey),
// )
// ],
// ),
// Container(
// height: Get.height * 0.04,
// width: Get.width * 0.2,
// decoration: BoxDecoration(
// color: _allData[index].color,
// borderRadius: BorderRadius.circular(30),
// ),
// child: Center(
// child: Text(
// _allData[index].text,
// style: TextStyle(color: _allData[index].iconColor, fontSize: 12),
// )),
// ),
// Column(
// children: [
// SizedBox(
// height: Get.height * 0.02,
// ),
// PopupMenuButton(
// offset: const Offset(0, 10),
// // padding: EdgeInsets.zero,
// constraints: BoxConstraints.expand(width: 120, height: 115),
// padding: EdgeInsets.all(12),
//
// // position: PopupMenuPosition.under,
// child: const Text(
// "View more",
// style: TextStyle(
// fontSize: 10,
// fontWeight: FontWeight.w700,
// decoration: TextDecoration.underline,
// ),
// ),
// itemBuilder: (context) {
// return [
// PopupMenuItem(
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.9,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(6),
// color: ColorRes.lightYellow),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset(
// AssetRes.pin,
// scale: 3,
// ),
// Text(
// 'Change Status',
// style: commonSubtitle(),
// )
// ],
// ),
// ),
// ),
// PopupMenuItem(
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.4,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(6),
// color: ColorRes.grey),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset(
// AssetRes.list,
// scale: 3,
// ),
// Text(
// 'List of machine',
// style: commonSubtitle(),
// )
// ],
// ),
// ))
// ];
// },
// ),
// SizedBox(height: Get.height * 0.02),
// Row(
// children: [
// Image.asset(
// AssetRes.calendar,
// scale: 2.5,
// ),
// const Text(
// '12 Dec, 2020',
// style: TextStyle(
// fontSize: 9,
// fontWeight: FontWeight.w400,
// color: ColorRes.black,
// ),
// )
// ],
// )
// ],
// )
// ],
// )
// ],
// ),
// ),
// )),
// )
//     : locationController.searchResults.isNotEmpty
// ? SizedBox(
// height: Get.height,
// child: ListView.builder(
// itemCount: locationController.searchResults.length,
// itemBuilder: (context, index) => Padding(
// padding: const EdgeInsets.only(top: 10),
// child: Container(
// height: 75,
// width: Get.width,
// decoration: BoxDecoration(
// color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(height: 10),
// Text(
// locationController.searchResults[index].title,
// style: commonTitle().copyWith(
// color: ColorRes.black,
// fontWeight: FontWeight.w600,
// fontSize: 13),
// ),
// SizedBox(height: 5),
// SizedBox(
// width: Get.width * 0.26,
// child: Text(
// overflow: TextOverflow.ellipsis,
// locationController.searchResults[index].subtitle,
// style: commonSubtitle()
//     .copyWith(color: ColorRes.grey, fontSize: 10),
// ),
// ),
// SizedBox(height: 5),
// Text(
// 'Machine: 7',
// style: commonSubtitle().copyWith(color: ColorRes.grey),
// )
// ],
// ),
// Container(
// height: Get.height * 0.04,
// width: Get.width * 0.2,
// decoration: BoxDecoration(
// color: locationController.searchResults[index].color,
// borderRadius: BorderRadius.circular(30),
// ),
// child: Center(
// child: Text(
// locationController.searchResults[index].active,
// // locationController.searchResults[index].text,
// style: TextStyle(
// color: locationController.searchResults[index].iconColor,
// fontSize: 12),
// )),
// ),
// Column(
// children: [
// SizedBox(
// height: Get.height * 0.02,
// ),
// PopupMenuButton(
// offset: const Offset(0, 10),
// // padding: EdgeInsets.zero,
// constraints: BoxConstraints.expand(width: 120, height: 115),
// padding: EdgeInsets.all(12),
//
// // position: PopupMenuPosition.under,
// child: const Text(
// "View more",
// style: TextStyle(
// fontSize: 10,
// fontWeight: FontWeight.w700,
// decoration: TextDecoration.underline,
// ),
// ),
// itemBuilder: (context) {
// return [
// PopupMenuItem(
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.9,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(6),
// color: ColorRes.lightYellow),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset(
// AssetRes.pin,
// scale: 3,
// ),
// Text(
// 'Change Status',
// style: commonSubtitle(),
// )
// ],
// ),
// ),
// ),
// PopupMenuItem(
// child: Container(
// height: Get.height * 0.06,
// width: Get.width * 0.4,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(6),
// color: ColorRes.grey),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset(
// AssetRes.list,
// scale: 3,
// ),
// Text(
// 'List of machine',
// style: commonSubtitle(),
// )
// ],
// ),
// ))
// ];
// },
// ),
// SizedBox(height: Get.height * 0.02),
// Row(
// children: [
// Image.asset(
// AssetRes.calendar,
// scale: 2.5,
// ),
// const Text(
// '12 Dec, 2020',
// style: TextStyle(
// fontSize: 9,
// fontWeight: FontWeight.w400,
// color: ColorRes.black,
// ),
// )
// ],
// )
// ],
// )
// ],
// )
// ],
// ),
// ),
// )),
// )
//     : Text('Not Found'),
