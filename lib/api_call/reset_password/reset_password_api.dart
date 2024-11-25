import 'dart:convert';

import 'package:route_runner/api_call/reset_password/reset_password_model.dart';
import 'package:route_runner/common/pop_up.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/utils/end_points.dart';

class ResetPasswordApi {
  static resetPasswordApi({required String password,required String employeeId,}) async {
    try {
      var headers = {
        'Content-Type': 'application/json'
      };

      var response = await HttpService.putApi(
        url: EndPoints.resetPassword + employeeId,
        body: {
          "password": password
        },
        header: headers
      );

      if (response?.statusCode == 200) {
        var decoded = jsonDecode(response!.body);

        print(decoded);

        if (decoded["success"] == true) {
          flutterToast("password reset successfully");

          return resetPasswordModelFromJson(response.body);
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
      return ResetPasswordModel();
    } catch (e) {

      print("Error: $e");

      return ResetPasswordModel();
    }
  }
}
