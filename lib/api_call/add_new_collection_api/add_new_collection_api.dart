import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:route_runner/api_call/add_new_collection_api/add_new_collection_model.dart';
import 'package:route_runner/api_call/add_new_repair_api/add_new_repair_model.dart';
import 'package:route_runner/common/pop_up.dart';
import 'package:route_runner/screens/collection_report/collection_report.dart';
import 'package:route_runner/screens/dash_board/dash_board_screen.dart';
import 'package:route_runner/screens/repair/repair_screen.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';

class CustomerNewCollectionApi {
  static Future<AddNewCollectionModel> customerNewCollectionApi({
    required String location,
    required String machineNumber,
    required String serialNumber,
    required String auditNumber,
    required String inNumbersPrevious,
    required String inNumbersCurrent,
    required String outNumbersPrevious,
    required String outNumbersCurrent,
    required String total,
    required String image,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=${PrefService.getString(PrefKeys.registerToken)}'
      };

      var body = jsonEncode({
        "machineNumber": machineNumber,
        "serialNumber": serialNumber,
        "auditNumber": auditNumber,
        "inNumbers": {
          "previous": inNumbersPrevious,
          "current": inNumbersCurrent
        },
        "outNumbers": {
          "previous": outNumbersPrevious,
          "current": outNumbersCurrent
        },
        "total": total,
        "image": image
      });

      var response = await HttpService.postApi(
        url: "${EndPoints.addNewCollection}${PrefService.getString(PrefKeys.employeeId)}/$location",
        body: body,
        header: headers,
      );

      if (response?.statusCode == 201) {
        var decoded = jsonDecode(response!.body);

        print(decoded);

        if (decoded["success"] == true) {
          flutterToast(decoded["message"]);
          Get.to(() => CollectionReportScreen());
          return addNewCollectionModelFromJson(response.body);
        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response?.statusCode}");
      }
      return AddNewCollectionModel();
    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
      return AddNewCollectionModel();
    }
  }
}
