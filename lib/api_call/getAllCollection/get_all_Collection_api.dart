import 'dart:convert';
import 'package:route_runner/api_call/getAllCollection/get_all_collection_model.dart';
import 'package:route_runner/api_call/get_last_collection_api/get_last_collection_model.dart';
import 'package:route_runner/api_call/get_repairs_api/get_repairs_model.dart';
import 'package:route_runner/api_call/get_service_report_api/get_service_report_model.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';
class GetAllCollectionApi {
  static getAllCollectionApi() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=${PrefService.getString(PrefKeys.registerToken)}'
      };

      var response = await HttpService.getApi(url:  "${EndPoints.allCollection}${PrefService.getString(PrefKeys.employeeId)}/report",
          header: headers
      );

      if (response?.statusCode == 200) {
        var decoded = jsonDecode(response!.body);

        print(decoded);

        if (decoded["success"] == true) {


          return getAllCollectionModelFromJson(response.body);
        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response?.statusCode}");
      return GetAllCollectionModel();
      }
    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
      return GetAllCollectionModel();
    }
  }
}
