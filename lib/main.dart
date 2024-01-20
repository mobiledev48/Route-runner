import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/screens/admin_view/admin_screen.dart';
import 'package:route_runner/screens/collection_detail/collection_detail_screen.dart';
import 'package:route_runner/screens/dash_board/dash_board_screen.dart';
import 'package:route_runner/screens/home_view/home_screen.dart';

import 'package:route_runner/screens/new_collection/new_collection_screen.dart';
import 'package:route_runner/screens/service_report_view/service_report_screen.dart';

import 'package:route_runner/screens/splash_screen/splash_screen.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: FirebaseOptions(apiKey: 'AIzaSyAt4xQpYoDogOiPDgisotAHFnkv6kx-3sk', appId: '1:770365062515:android:0d213db9f6b276de5f1906', messagingSenderId: '770365062515', projectId: 'route-runner-9fb1d')
  );
  await PrefService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorRes.mainColor),
        fontFamily: 'Nunito',
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
