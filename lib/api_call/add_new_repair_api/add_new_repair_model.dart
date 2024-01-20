// To parse this JSON data, do
//
//     final addNewRepairModel = addNewRepairModelFromJson(jsonString);

import 'dart:convert';

AddNewRepairModel addNewRepairModelFromJson(String str) => AddNewRepairModel.fromJson(json.decode(str));

String addNewRepairModelToJson(AddNewRepairModel data) => json.encode(data.toJson());

class AddNewRepairModel {
  bool? success;
  String? message;
  NewRepairs? newRepairs;

  AddNewRepairModel({
     this.success,
     this.message,
     this.newRepairs,
  });

  factory AddNewRepairModel.fromJson(Map<String, dynamic> json) => AddNewRepairModel(
    success: json["success"],
    message: json["message"],
    newRepairs: NewRepairs.fromJson(json["newRepairs"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "newRepairs": newRepairs?.toJson(),
  };
}

class NewRepairs {
  String? machineNumber;
  String? serialNumber;
  String? auditNumber;
  DateTime? date;
  String? time;
  String? reporterName;
  String? statusOfRepair;
  String? issue;
  String? image;
  String? id;
  int? v;

  NewRepairs({
     this.machineNumber,
     this.serialNumber,
     this.auditNumber,
     this.date,
     this.time,
     this.reporterName,
     this.statusOfRepair,
     this.issue,
     this.image,
     this.id,
     this.v,
  });

  factory NewRepairs.fromJson(Map<String, dynamic> json) => NewRepairs(
    machineNumber: json["machineNumber"],
    serialNumber: json["serialNumber"],
    auditNumber: json["auditNumber"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    reporterName: json["reporterName"],
    statusOfRepair: json["statusOfRepair"],
    issue: json["issue"],
    image: json["image"],
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "machineNumber": machineNumber,
    "serialNumber": serialNumber,
    "auditNumber": auditNumber,
    "date": date?.toIso8601String(),
    "time": time,
    "reporterName": reporterName,
    "statusOfRepair": statusOfRepair,
    "issue": issue,
    "image": image,
    "_id": id,
    "__v": v,
  };
}
