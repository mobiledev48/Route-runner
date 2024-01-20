import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:route_runner/api_call/auth/update_profile_api/update_profile_model.dart';
import 'package:route_runner/common/pop_up.dart';
import 'package:route_runner/screens/dash_board/dash_board_screen.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';
class CustomerUpdateProfileApi {
  static customerUpdateProfileApi({required String firstName, required String lastName, required String phone, required String email, required String image}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=${PrefService.getString(PrefKeys.registerToken)}'
      };

      var response = await HttpService.putApi(
        url: "${EndPoints.editProfile}${PrefService.getString(PrefKeys.employeeId)}",
        body: {
          "firstname": firstName,
          "lastname": lastName,
          "phone": phone,
          "email": email,
          "image": image,
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
