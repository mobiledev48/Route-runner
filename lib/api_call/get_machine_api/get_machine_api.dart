import 'dart:convert';
import 'package:route_runner/api_call/get_machine_api/get_machine_model.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';
class CustomerGetMachineApi {
  static customerGetMachineApi({page,limit,search}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=${PrefService.getString(PrefKeys.registerToken)}'
      };

      var response = await HttpService.getApi(url:"${EndPoints.getMachine}${PrefService.getString(PrefKeys.employeeId)}?search=${search ?? ""}&page=${page ?? ""}&limit=${limit ?? ""}"
          ,
      header: headers
      );

      if (response?.statusCode == 200) {
        var decoded = jsonDecode(response!.body);

        print("get machine data -> $decoded");

        if (decoded["success"] == true) {


          return getMachinesModelFromJson(response.body);
        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response?.statusCode}");
      }
      return GetMachinesModel();
    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
      return GetMachinesModel();
    }
  }
}
