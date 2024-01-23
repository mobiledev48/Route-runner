import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:route_runner/api_call/get_pending_repairs_api/get_pending_repairs_model.dart';
import 'package:route_runner/api_call/get_recent_collection_api/get_recent_collection_model.dart';
import 'package:route_runner/utils/asset_res.dart';

import '../../api_call/get_pending_repairs_api/get_pending_repairs_api.dart';
import '../../api_call/get_recent_collection_api/get_recent_collection_api.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';

class HomeController extends GetxController {
  TextEditingController auditController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool loader = false.obs;
  void Currentindex(index) {
    currentIndex = index;
    update(['home']);
  }




  int currentIndex = 0;

  Widget dividers(double end, double start) {
    return Divider(
      height: 1,
      thickness: 0.1,
      color: ColorRes.grey,
      endIndent: end,
      indent: start,
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

  List<bool> isViewData = [];
  List<bool> isClick = [];
  num calculateSubtractedValue({num? In, num? out}) {
    num total = (In ?? 0) - (out ?? 0);
    return total;
  }
  GerRecentCollectionModel gerRecentCollectionModel = GerRecentCollectionModel();
  // List<GroupedReports> recentCollectionList = [];
 List<LastThreeCollectionReports> recentCollectionList = [];


  Future<void> getRecentCollection() async {
    loader.value = true;

    // Assuming CustomerGetRecentCollectionApi.customerGetRecentCollectionApi()
    // returns an instance of GerRecentCollectionModel.
    gerRecentCollectionModel =
    await CustomerGetRecentCollectionApi.customerGetRecentCollectionApi();

    recentCollectionList.addAll(gerRecentCollectionModel.lastThreeCollectionReports ?? []);
    isViewData = List.generate(recentCollectionList.length, (index) => false);
    isClick = List.generate(recentCollectionList.length, (index) => false);
    loader.value = false;
    update(['home']);
  }

  GetPendingRepairModel getPendingRepairModel=GetPendingRepairModel();
  List<LastTwoPendingRepairs> lastTwoPendingRepairs = [];

  getPendingRepairs() async {
    loader.value = true;
    getPendingRepairModel = await CustomerGetPendingRepairsApi.customerGetPendingRepairsApi();
    lastTwoPendingRepairs.addAll(getPendingRepairModel.lastTwoPendingRepairs ?? []);

    loader.value = false;
    update(['home']);
  }




  // List<collectionDetail> recentCollectionList = [
  //   collectionDetail(serialNo: '#1-876364', location: 'Moonlight Bar', total: '\$500', listData: [
  //     ListData(machine: 'Machine: 7', current: [Current(cur: 2000, pre: 2500)])
  //   ]),
  //   collectionDetail(serialNo: '#3-876368', location: 'Black Sleep Bar', total: '\$400', listData: [
  //     ListData(machine: 'Machine: 4', current: [Current(cur: 2000, pre: 2500)])
  //   ]),
  //   collectionDetail(serialNo: '#4-876621', location: 'GameClub', total: '\$600', listData: [
  //     ListData(machine: 'Machine: 9', current: [Current(cur: 2000, pre: 2500)])
  //   ])
  // ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRecentCollection();
    getPendingRepairs();

  }
}

class collectionDetail {
  String? serialNo;
  String? location;
  String? total;
  List<ListData>? listData;

  collectionDetail({this.serialNo, this.location, this.total, this.listData});
}

class ListData {
  String? machine;
  List<Current>? current;
  List<Current>? previos;

  ListData({this.machine, this.current, this.previos});
}

class Current {
  num? pre;
  num? cur;

  Current({this.pre, this.cur});
}
