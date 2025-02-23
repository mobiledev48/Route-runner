import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:route_runner/screens/splash_screen/splash_screen.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/color_res.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isIOS)
    {
      await Firebase.initializeApp(

          options: const FirebaseOptions(apiKey: 'AIzaSyB99caHhRW1ypsBrgI3xLOZUvfxXfGDeBg',
              appId: '1:770365062515:ios:411d54244a024f7c5f1906', messagingSenderId: '770365062515', projectId: 'route-runner-9fb1d')
      );
    }
  else
    {
      await Firebase.initializeApp(

          options: const FirebaseOptions(apiKey: 'AIzaSyAt4xQpYoDogOiPDgisotAHFnkv6kx-3sk', appId: '1:770365062515:android:0d213db9f6b276de5f1906', messagingSenderId: '770365062515', projectId: 'route-runner-9fb1d')
      );
    }
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
