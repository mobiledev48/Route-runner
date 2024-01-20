// To parse this JSON data, do
//
//     final getMachinesModel = getMachinesModelFromJson(jsonString);

import 'dart:convert';

GetRepairsModel getRepairsModelFromJson(String str) => GetRepairsModel.fromJson(json.decode(str));

String getRepairsModelToJson(GetRepairsModel data) => json.encode(data.toJson());

class GetRepairsModel {
  bool? success;
  String? message;
  List<RepairReports>? repairReports;

  GetRepairsModel({this.success, this.message, this.repairReports});

  GetRepairsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['repairReports'] != null) {
      repairReports = <RepairReports>[];
      json['repairReports'].forEach((v) {
        repairReports!.add(new RepairReports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.repairReports != null) {
      data['repairReports'] =
          this.repairReports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepairReports {
  String? statusOfRepair;
  String? sId;
  String? machineNumber;
  String? serialNumber;
  String? auditNumber;
  String? date;
  String? time;
  String? reporterName;
  String? issue;
  String? image;
  int? iV;

  RepairReports(
      {this.statusOfRepair,
        this.sId,
        this.machineNumber,
        this.serialNumber,
        this.auditNumber,
        this.date,
        this.time,
        this.reporterName,
        this.issue,
        this.image,
        this.iV});

  RepairReports.fromJson(Map<String, dynamic> json) {
    statusOfRepair = json['statusOfRepair'];
    sId = json['_id'];
    machineNumber = json['machineNumber'];
    serialNumber = json['serialNumber'];
    auditNumber = json['auditNumber'];
    date = json['date'];
    time = json['time'];
    reporterName = json['reporterName'];
    issue = json['issue'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusOfRepair'] = this.statusOfRepair;
    data['_id'] = this.sId;
    data['machineNumber'] = this.machineNumber;
    data['serialNumber'] = this.serialNumber;
    data['auditNumber'] = this.auditNumber;
    data['date'] = this.date;
    data['time'] = this.time;
    data['reporterName'] = this.reporterName;
    data['issue'] = this.issue;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}
