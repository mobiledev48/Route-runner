import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color_res.dart';

class CollectionReportController extends GetxController {
  // bool onClick = false;
  List<bool> onClick  = [];
  List<bool> isClick  = [];
  void nextPage(index) {
    onClick = index;
    update(['collection']);
  }

  List<bool> isViewData  = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isViewData = List.generate(allCollectionData.length, (index) => false);
    isClick = List.generate(allCollectionData.length, (index) => false);
  }


  Widget customCheckbox(int index) {
    return GestureDetector(
        onTap: () {
          isClick[index] = !isClick[index];
          update(['collection']);
        },
        child: isClick[index]
            ? Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              border: Border.all(color: ColorRes.mainColor),
              color: ColorRes.mainColor,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Icon(
            size: 14,
            Icons.check,
            color: Colors.white,
          ),
        )
            : Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ));
  }


  num calculateTotalValue(num? In, num? out) {
    num total = (In ?? 0) + (out ?? 0);
    return total;
  }
  num calculateTotal(num? In, num? out) {
    num total = (In ?? 0) + (out ?? 0);
    return total;
  }

  List<allData> allCollectionData = [
    allData(
      title: 'Moonlight Bar',
      employeeName: 'Arrora gaur',
      address: "4617 Briercliff Road, New York, NY 10011",
      machineDetails: [
        MachineDetails(
          machineId: 1,
          current: [
            Current(In: 10, out: 5),
            Current(In: 8, out: 3),
          ],
          previous: [
            Current(In: 15, out: 7),
            Current(In: 12, out: 4),
          ],
        ),
        MachineDetails(
          machineId: 2,
          current: [
            Current(In: 20, out: 10),
            Current(In: 28, out: 31),
          ],
          previous: [
            Current(In: 15, out: 9),
            Current(In: 13, out: 4),
          ],
        ),
        MachineDetails(
          machineId: 3,
          current: [
            Current(In: 10, out: 5),
            Current(In: 8, out: 3),
          ],
          previous: [
            Current(In: 15, out: 7),
            Current(In: 12, out: 4),
          ],
        ),
      ],
    ),
    allData(
      title: 'Black Sleep Bar',
      employeeName: 'Trevor Yowell',
      address: "4617 Briercliff Road, New York, NY 10011",
      machineDetails: [
        MachineDetails(
          machineId: 1,
          current: [
            Current(In: 10, out: 5),
          ],
          previous: [
            Current(In: 5, out: 5),
          ],
        ),
        MachineDetails(
          machineId: 2,
          current: [
            Current(In: 20, out: 10),
          ],
          previous: [
            Current(In: 15, out: 9),
          ],
        ),

      ],
    ),
  ];

}

class allData {
  String? title;
  String? employeeName;
  String? address;
  List<MachineDetails>? machineDetails;
  int? machine;
  // Adjust the constructor to compute the machine length based on machineDetails
  allData({this.title, this.employeeName, this.machineDetails,this.machine,this.address}) {
    machine = machineDetails?.length ?? 0;
  }


}

class MachineDetails {
  int? machineId;
  List<Current>? current;
  List<Current>? previous;

  MachineDetails({this.machineId, this.current, this.previous});
}

class Current {
  num? In;
  num? out;

  Current({this.In, this.out});
}
