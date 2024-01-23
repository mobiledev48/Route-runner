// To parse this JSON data, do
//
//     final getMachinesModel = getMachinesModelFromJson(jsonString);

import 'dart:convert';

GetPendingRepairModel getPendingRepairModelFromJson(String str) => GetPendingRepairModel.fromJson(json.decode(str));

String getPendingRepairModelToJson(GetPendingRepairModel data) => json.encode(data.toJson());

class GetPendingRepairModel {
  bool? success;
  String? message;
  List<LastTwoPendingRepairs>? lastTwoPendingRepairs;

  GetPendingRepairModel(
      {this.success, this.message, this.lastTwoPendingRepairs});

  GetPendingRepairModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['lastTwoPendingRepairs'] != null) {
      lastTwoPendingRepairs = <LastTwoPendingRepairs>[];
      json['lastTwoPendingRepairs'].forEach((v) {
        lastTwoPendingRepairs!.add(new LastTwoPendingRepairs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.lastTwoPendingRepairs != null) {
      data['lastTwoPendingRepairs'] =
          this.lastTwoPendingRepairs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LastTwoPendingRepairs {
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

  LastTwoPendingRepairs(
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

  LastTwoPendingRepairs.fromJson(Map<String, dynamic> json) {
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


