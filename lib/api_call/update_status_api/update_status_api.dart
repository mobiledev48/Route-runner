import 'dart:convert';
import 'package:route_runner/api_call/auth/update_profile_api/update_profile_model.dart';
import 'package:route_runner/common/pop_up.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';
class CustomerUpdateStatusApi {
  static customerUpdateStatusApi({status,locationId}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=${PrefService.getString(PrefKeys.registerToken)}'
      };

      var response = await HttpService.putApi(
        url: "${EndPoints.employeeStatus}${PrefService.getString(PrefKeys.employeeId)}/$locationId",
        body: {
          "activeEmployeeStatus": status ?? "",
        },
        header: headers,
      );

      if (response?.statusCode == 200) {
        var decoded = jsonDecode(response!.body);

        print(decoded);

        if (decoded["success"] == true) {
          flutterToast(decoded["message"]);
          return updateProfileModelFromJson(response.body);
        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response?.statusCode}");
      }
      return UpdateProfileModel();
    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
      return UpdateProfileModel();
    }
  }
}
