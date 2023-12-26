import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:route_runner/model/location_model.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:http/http.dart' as http;
import 'package:route_runner/utils/pref_keys.dart';
class LocationController extends GetxController {
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

      http.Response? response =
      await HttpService.getApi(url:"http://192.168.29.98:5050/api/location/${PrefService.getString(PrefKeys.loginId)}", header: {
        "Content-Type": "application/json",
        'Authorization':"Bearer ${PrefService.getString(PrefKeys.registerToken)}"
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
