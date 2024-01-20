import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:route_runner/api_call/api_call/auth/signIn_api/sign_in_model.dart';
import 'package:route_runner/common/pop_up.dart';
import 'package:route_runner/screens/dash_board/dash_board_screen.dart';
import 'package:route_runner/service/http_services.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/end_points.dart';
import 'package:route_runner/utils/pref_keys.dart';

class CustomerSignInApi {
  static customerSignInApi({required String email, required String password}) async {
    try {
      var response = await HttpService.postApi(
        url: EndPoints.login,
        body: {
          "email": email.toString(),
          "password": password.toString(),
        },
      );

      if (response?.statusCode == 200) {
        var decoded = jsonDecode(response!.body);

        print(decoded);

        if (decoded["success"] == true) {
          PrefService.setValue(PrefKeys.login, true);
          Get.to(() => DashBoardScreen());
          flutterToast(decoded["message"]);
          return signInModelFromJson(response.body);


        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response?.statusCode}");
      }
      return SignInModel();
    } catch (e) {
      print("Error: $e");
      return SignInModel();
    }
  }
}
