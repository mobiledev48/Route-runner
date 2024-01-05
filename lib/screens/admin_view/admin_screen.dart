import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/screens/admin_view/admin_controller.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/pref_keys.dart';
import 'package:route_runner/utils/text_style.dart';
import '../../common/button.dart';
import '../../common/custom_checkbox.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../dash_board/dash_board_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AdminController adminController = Get.put(AdminController());
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: GetBuilder<AdminController>(
              id: 'admin',
              builder: (controller) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Image.asset(
                        AssetRes.splashLogo,
                        color: ColorRes.mainColor,
                        scale: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(StringRes.RRlogin, style: logoStyle()),
                    ),
                    adminController.formView(),
                    CustomCheckbox(),
                    const SizedBox(
                      height: 27,
                    ),
                    Button(
                      height: 50,
                      width: 321,
                      onpressed: () {
                        FocusScope.of(context).unfocus();
                        if (adminController.validator()) {
                          Get.to(() => DashBoardScreen());
                          PrefService.setValue(PrefKeys.login, true);
                        }
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
