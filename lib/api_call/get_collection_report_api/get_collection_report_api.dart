import 'dart:convert';
import 'package:route_runner/api_call/get_collection_report_api/get_collection_report_model.dart';
import 'package:route_runner/api_call/get_repairs_api/get_repairs_model.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';

import 'package:http/http.dart' as http;
class CustomerGetCollectionReportApi {
  static customerGetCollectionReportApi({page,limit,search}) async {
    try {


    /*  var headers = {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YTYwNTI2OTA0YjVmNGZlZWMzN2I0NiIsImlhdCI6MTcwNjU4ODkyNywiZXhwIjoxNzA2Njc1MzI3fQ.651Bdo1ltnOJq6bKf19ewpEUUW3lfZPykC-LdsL1ZW8',
        'Cookie': 'refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YTYwNTI2OTA0YjVmNGZlZWMzN2I0NiIsImlhdCI6MTcwNjU4NjgwNSwiZXhwIjoxNzA2ODQ2MDA1fQ.sjan1d9GrP_y8FGLLxPcCKpHbE9wh6NmdggErz8RGiA'
      };
      var request = http.Request('GET', Uri.parse('https://routerunnerserver.onrender.com/api/employee/collection/65a60526904b5f4feec37b46/report?searchLocation=&page=1&limit=10'));
      request.body = '''''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }*/

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YTYwNTI2OTA0YjVmNGZlZWMzN2I0NiIsImlhdCI6MTcwNjU4NjgwNSwiZXhwIjoxNzA2ODQ2MDA1fQ.sjan1d9GrP_y8FGLLxPcCKpHbE9wh6NmdggErz8RGiA'
      };

      var response = await HttpService.getApi(
          url:  "${EndPoints.getCollection}${PrefService.getString(PrefKeys.employeeId)}/report?searchLocation=${search ?? ""}&page=${page ?? ""}&limit=${limit ?? ""}",
      header: headers
      );



      if (response!.statusCode == 200) {
        print("========================${response.statusCode}");
        var decoded = jsonDecode(response.body);

        print(decoded);

        if (decoded["success"] == true) {
          return getCollectionReportModelFromJson(response.body);
        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response.statusCode}");
      }
      return GetCollectionReportModel();
    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
      return GetCollectionReportModel();
    }
  }
}
