import 'dart:convert';
import 'package:route_runner/common/pop_up.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';
class ChangeLocationStatusApi {
  static changeLocationStatusApi({status}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=${PrefService.getString(PrefKeys.registerToken)}'
      };

      var response = await HttpService.putApi(
        url: "${EndPoints.locationApi}${PrefService.getString(PrefKeys.employeeId)}/activestatus",
        body: {
          "activestatus": status ?? "",
        },
        header: headers,
      );

      if (response?.statusCode == 200) {
        var decoded = jsonDecode(response!.body);

        print(decoded);

        if (decoded["success"] == true) {
          flutterToast(decoded["message"]);

        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response?.statusCode}");
      }

    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
    }
  }
}
