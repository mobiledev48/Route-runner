import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:route_runner/common/button.dart';
import 'package:route_runner/screens/Otp_screen/otp_controller.dart';
import 'package:route_runner/screens/admin_view/admin_screen.dart';
import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/strings.dart';
import 'package:route_runner/utils/text_style.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key, required this.email,required this.employeeId}) : super(key: key);
  final String email;
  final String employeeId;
  final OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const AdminScreen());
        return true;
      },
      child: GetBuilder<OtpController>(
          id: "otp",
          builder: (con) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                alignment: Alignment.center,

                children: [
                  InkWell(
                    onTap: (){
                      FocusScope.of(context).unfocus();
                    },
                    splashFactory: NoSplash.splashFactory,
                    highlightColor: Colors.transparent,
                    
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      height: Get.height,
                      width: Get.width,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              child: Text(StringRes.otpVerification, style: logoStyle()),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Center(
                                child: Text("We have sent the code verification to your email address ${email}",
                                    textAlign: TextAlign.center,
                                    style: logoStyle()),
                              ),
                            ),
                            const SizedBox(height: 45),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                height: 50,
                                child: PinCodeTextField(
                                    animationType: AnimationType.scale,
                                    appContext: context,
                                    enablePinAutofill: true,
                                    controller: otpController.otpController,
                                    length: 6,
                                    cursorColor: Colors.black,
                                    obscureText: false,
                                    enableActiveFill: true,
                                    textStyle: commonSubtitle(),
                                    obscuringCharacter: '*',
                                    keyboardType: TextInputType.number,
                                    autoDismissKeyboard: true,
                                    boxShadows: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                          offset: const Offset(1, 1),
                                          color: ColorRes.themeColor.withOpacity(0.2))
                                    ],
                                    pinTheme: PinTheme.defaults(
                                        shape: PinCodeFieldShape.circle,
                                        borderRadius: BorderRadius.circular(50),
                                        fieldHeight: 40,
                                        fieldWidth: 40,
                                        activeColor: Colors.white,
                                        activeFillColor: Colors.white,
                                        inactiveFillColor: Colors.white,
                                        disabledColor: Colors.white,
                                        selectedFillColor: Colors.white,
                                        inactiveColor: Colors.white,
                                        selectedColor: Colors.white),
                                    keyboardAppearance: Brightness.light,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (val) {},
                                    onChanged: (value) async {}),
                              ),
                            ),
                            (otpController.otpError != "")
                                ? Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  otpController.otpError,
                                  style: commonSubtitle(
                                      ).copyWith(color: ColorRes.red),
                                ),
                              ),
                            )
                                : const SizedBox(),
                            const Spacer(),
                            ForgotButton(
                              height: 50,
                              width: 321,
                              onpressed: () {
                                FocusScope.of(context).unfocus();


                                  otpController.onTapSubmit();
                                  if(otpController.otpError =="")
                                    {
                                      otpController.verifyOtp(employeeId);
                                    }

                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(() => otpController.loader.value == true
                      ? const CircularProgressIndicator()
                      : const SizedBox()),
                ],
              ),
            );
          }),
    );
  }
}
