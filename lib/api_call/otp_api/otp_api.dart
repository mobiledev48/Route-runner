import 'dart:convert';

import 'package:route_runner/api_call/otp_api/otp_model.dart';
import 'package:route_runner/common/pop_up.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/utils/end_points.dart';

class OtpApi {
  static optApi({required String otp,required String employeeId}) async {
    try {
      var response = await HttpService.postApi(
        url: EndPoints.otp + employeeId,
        body: {
          "otp": otp,
        },
      );

      if (response?.statusCode == 200) {
        var decoded = jsonDecode(response!.body);

        print(decoded);

        if (decoded["success"] == true) {

          return otpModelFromJson(response.body);
        } else {
          // Handle other success scenarios if needed
          print("Success is false: ${decoded["message"]}");
        }
      } else {

        var decoded = jsonDecode(response!.body);
errorToast(decoded["message"]);
        print("HTTP Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");

      }
      return OtpModel();
    } catch (e) {

      print("Error: $e");

      return OtpModel();
    }
  }
}
