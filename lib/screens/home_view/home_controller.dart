import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:route_runner/utils/asset_res.dart';

import '../../utils/color_res.dart';
import '../../utils/strings.dart';

class HomeController extends GetxController {
  TextEditingController auditController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void Currentindex(index) {
    currentIndex = index;
    update(['home']);
  }

  int currentIndex = 0;
  Widget dividers() {
    return Divider(
      height: 1,
      color: ColorRes.grey,
      endIndent: 5,
      indent: 5,
    );
  }

  List title = [
    StringRes.serialNo,
    StringRes.location,
    StringRes.current,
    StringRes.previous,
    StringRes.total,
  ];

  List imageList = [AssetRes.ticketVoucher, AssetRes.settingsFuture, AssetRes.fileDocument, AssetRes.logOut];

  List drawerTitle = [
    StringRes.collectionReport,
    StringRes.repair,
    StringRes.serviceReport,
    StringRes.logout,
  ];

  List pendingRepair1 = ['Serial No: #1-876364', 'Location: Moonlight Bar', 'Issue: Joy stick not working'];

  List pendingRepair2 = ['Reporter: Steven', 'Date: 15 Dec, 2023', 'Time: 11:06 AM'];
}
