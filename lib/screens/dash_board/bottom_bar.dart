// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../utils/asset_res.dart';
// import '../../utils/color_res.dart';
// import '../../utils/strings.dart';
// import 'dash_board_controller.dart';
//
// class BottomBar extends StatelessWidget {
//   final Void
//    BottomBar({super.key});
//   DashBoardController dashBoardController = Get.put(DashBoardController());
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
//       child: InkWell(
//         splashColor: Colors.transparent,
//         splashFactory: NoSplash.splashFactory,
//         focusColor: Colors.transparent,
//         hoverColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         onTap: () {
//           dashBoardController.nextPage(0);
//           dashBoardController.update(['dash']);
//         },
//         child: Column(
//           children: [
//             Image.asset(
//               AssetRes.home,
//               scale: 3,
//               color: dashBoardController.currentIndex == 0 ? ColorRes.mainColor : Colors.grey,
//             ),
//             SizedBox(height: 10),
//             Text(
//               StringRes.home,
//               style: TextStyle(
//                   color: dashBoardController.currentIndex == 0 ? ColorRes.mainColor : Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
