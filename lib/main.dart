import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/screens/dash_board/dash_board_screen.dart';
import 'package:route_runner/screens/splash_screen/splash_screen.dart';
import 'package:route_runner/service/pref_services.dart';
import 'package:route_runner/utils/asset_res.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
//
// class MyApps extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('PopupMenuButton Example'),
//           actions: [
//             PopupMenuButton(
//               padding: EdgeInsets.zero,
//               color: const Color(0xFFFFF7E8),
//               icon: Image.asset(AssetRes.machine, scale: 4),
//               itemBuilder: (context) {
//                 return controller.popup
//                     .map(
//                       (ele) => PopupMenuItem(
//                         enabled: false,
//                         height: Get.height * 0.045,
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                             if (ele["text"] == StringRes.machine) {
//                               print("============ ${e.exercisesList!.length}");
//                               pushNewScreen(
//                                   context,
//                                   EditWorkOutBuilderScreen(
//                                     exercises: e.exercisesList,
//                                     currIndex: index,
//                                     workoutName: e.workoutName,
//                                   ));
//                             } else {
//                               print("delete");
//                               controller.getWorkoutPlanModal.data?.workouts?.remove(e);
//                             }
//                             controller.update(["update_workout_date_wise"]);
//                           },
//                           child: SizedBox(
//                             height: Get.height * 0.045,
//                             width: Get.width * 0.2,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Image.asset(ele["icon"], scale: 2.5),
//                                 Text(
//                                   ele["text"],
//                                   // style: interRegular(fontSize: 12, color: ColorRes.yellowDark.withOpacity(1))
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                     .toList();
//               },
//             ),
//           ],
//         ),
//         body: Center(
//           child: Text('Popup Menu Example'),
//         ),
//       ),
//     );
//   }
// }
