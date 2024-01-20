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
  int? currentPage;

  GetRepairsModel(
      {this.success, this.message, this.repairReports, this.currentPage});

  GetRepairsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['repairReports'] != null) {
      repairReports = <RepairReports>[];
      json['repairReports'].forEach((v) {
        repairReports!.add(new RepairReports.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.repairReports != null) {
      data['repairReports'] =
          this.repairReports!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    return data;
  }
}

class RepairReports {
  String? sId;
  String? machineNumber;
  String? serialNumber;
  String? auditNumber;
  String? date;
  String? time;
  String? reporterName;
  String? location;
  String? statusOfRepair;
  String? issue;
  String? image;
  int? iV;
  String? id;

  RepairReports(
      {this.sId,
        this.machineNumber,
        this.serialNumber,
        this.auditNumber,
        this.date,
        this.time,
        this.reporterName,
        this.location,
        this.statusOfRepair,
        this.issue,
        this.image,
        this.iV,
        this.id});

  RepairReports.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    machineNumber = json['machineNumber'];
    serialNumber = json['serialNumber'];
    auditNumber = json['auditNumber'];
    date = json['date'];
    time = json['time'];
    reporterName = json['reporterName'];
    location = json['location'];
    statusOfRepair = json['statusOfRepair'];
    issue = json['issue'];
    image = json['image'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['machineNumber'] = this.machineNumber;
    data['serialNumber'] = this.serialNumber;
    data['auditNumber'] = this.auditNumber;
    data['date'] = this.date;
    data['time'] = this.time;
    data['reporterName'] = this.reporterName;
    data['location'] = this.location;
    data['statusOfRepair'] = this.statusOfRepair;
    data['issue'] = this.issue;
    data['image'] = this.image;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}
