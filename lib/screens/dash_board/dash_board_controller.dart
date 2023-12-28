import 'package:get/get.dart';
import 'package:route_runner/screens/employee_view/employee_screen.dart';
import 'package:route_runner/screens/home_view/home_screen.dart';
import 'package:route_runner/screens/location_view/location_screen.dart';
import 'package:route_runner/screens/machine_view/machine_screen.dart';
import 'package:route_runner/screens/profile_view/profile_screen.dart';

import '../collection_report/collection_report.dart';
import '../repair/repair_screen.dart';

class DashBoardController extends GetxController {
  int currentIndex = 0;

  void nextPage(index) {
    currentIndex = index;
    update(['dash']);
  }

  List screen = [HomeScreen(), LocationScreen(), MachineScreen(), ProfileScreen()];
}
