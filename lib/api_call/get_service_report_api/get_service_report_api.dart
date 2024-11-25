import 'dart:convert';
import 'package:route_runner/api_call/get_service_report_api/get_service_report_model.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';
class CustomerGetServiceReportApi {
  static customerGetServiceReportApi({search,page,limit}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=${PrefService.getString(PrefKeys.registerToken)}'
      };

      var response = await HttpService.getApi(url:  "${EndPoints.getServiceReport}${PrefService.getString(PrefKeys.employeeId)}/report?searchService=${search ?? ""}&page=${page ?? ""}&limit=${limit ?? ""}",
      header: headers
      );

      if (response?.statusCode == 200) {
        var decoded = jsonDecode(response!.body);

        print(decoded);

        if (decoded["success"] == true) {


          return getServiceReportModelFromJson(response.body);
        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response?.statusCode}");
      }
      return GetServiceReportModel();
    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
      return GetServiceReportModel();
    }
  }
}
