import 'dart:convert';
import 'package:get/get.dart';
import 'package:route_runner/api_call/add_new_repair_api/add_new_repair_model.dart';
import 'package:route_runner/screens/repair/repair_controller.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';
RepairController repairController = Get.put(RepairController());
class CustomerNewRepairApi {
  static Future<AddNewRepairModel> customerNewRepairApi({
    required String location,
    required String machineNumber,
    required String serialNumber,
    required String auditNumber,
    required String date,
    required String time,
    required String reporterName,
    required String issue,
    required List image,
    required String machineId,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=${PrefService.getString(PrefKeys.registerToken)}'
      };

      // var body = jsonEncode({
      //   "location": location,
      //   "machineNumber": machineNumber,
      //   "serialNumber": serialNumber,
      //   "auditNumber": auditNumber,
      //   "date": date,
      //   "time": time,
      //   "reporterName": reporterName,
      //   "issue": issue,
      //   "image": image
      // });
      var body = {

          "date": date,
          "time": time,
          "reporterName": reporterName,
          "issue": issue,
          "imageOfRepair": jsonEncode(image)

      };

      var response = await HttpService.putApi(
        url: "${EndPoints.addNewRepair}$location/$machineId/${PrefService.getString(PrefKeys.employeeId)}",
        body: body,
        header: headers,
      );

      if (response?.statusCode == 201 || response?.statusCode ==200) {
        var decoded = jsonDecode(response!.body);

        print(decoded);

        if (decoded["success"] == true) {
          // Get.to(() => RepairScreen());

          repairController.repairReportData.clear();
          // repairController.currentPage = 1;
          repairController.getRepair();
          Get.back();
          repairController.update(['location']);
          return addNewRepairModelFromJson(response.body);
        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response?.statusCode}");
      }
      return AddNewRepairModel();
    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
      return AddNewRepairModel();
    }
  }
}
