import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trainer_x/api_call/auth/signIn_api/sign_in_model.dart';
import 'package:trainer_x/commons/toast_message.dart';
import 'package:trainer_x/services/pref_services.dart';
import 'package:trainer_x/utils/endpoints.dart';
import 'package:trainer_x/utils/pref_keys.dart';


class CustomerSignInApi {
  static customerSignInApi() async {
    final url = Uri.parse(EndPoints.signIn);
    var request = http.MultipartRequest('POST', url);

    request.fields.addAll({
      'phone_no': "${PrefService.getString(PrefKeys.countryCode)}${PrefService.getString(PrefKeys.phoneNo)}",
    });

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var responded = await http.Response.fromStream(response);
        final decoded = jsonDecode(responded.body);

        print(decoded);

        if (decoded["status"] == true) {
          PrefService.setValue(PrefKeys.isLogin, true);
          return signInModelFromJson(responded.body);
        } else {
          showToast(decoded["message"]);
        }
      } else {}
      return SignInModel();
    } catch (e) {
      print("=========>>  $e");
      return SignInModel();
    }
  }
}
