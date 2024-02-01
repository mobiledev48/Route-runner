// To parse this JSON data, do
//
//     final addNewRepairModel = addNewRepairModelFromJson(jsonString);

import 'dart:convert';

AddNewRepairModel addNewRepairModelFromJson(String str) => AddNewRepairModel.fromJson(json.decode(str));

String addNewRepairModelToJson(AddNewRepairModel data) => json.encode(data.toJson());

class AddNewRepairModel {
  bool? success;
  String? message;
  Data? data;

  AddNewRepairModel({
    this.success,
    this.message,
    this.data,
  });

  factory AddNewRepairModel.fromJson(Map<String, dynamic> json) => AddNewRepairModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  UpdatedLocation? updatedLocation;
  UpdatedRepairReport? updatedRepairReport;

  Data({
    this.updatedLocation,
    this.updatedRepairReport,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    updatedLocation: json["updatedLocation"] == null ? null : UpdatedLocation.fromJson(json["updatedLocation"]),
    updatedRepairReport: json["updatedRepairReport"] == null ? null : UpdatedRepairReport.fromJson(json["updatedRepairReport"]),
  );

  Map<String, dynamic> toJson() => {
    "updatedLocation": updatedLocation?.toJson(),
    "updatedRepairReport": updatedRepairReport?.toJson(),
  };
}

class UpdatedLocation {
  String? id;
  String? admin;
  String? locationname;
  String? address;
  String? percentage;
  List<String>? machines;
  List<String>? employees;
  int? numofmachines;
  bool? statusOfPayment;
  String? activeStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  UpdatedLocation({
    this.id,
    this.admin,
    this.locationname,
    this.address,
    this.percentage,
    this.machines,
    this.employees,
    this.numofmachines,
    this.statusOfPayment,
    this.activeStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UpdatedLocation.fromJson(Map<String, dynamic> json) => UpdatedLocation(
    id: json["_id"],
    admin: json["admin"],
    locationname: json["locationname"],
    address: json["address"],
    percentage: json["percentage"],
    machines: json["machines"] == null ? [] : List<String>.from(json["machines"]!.map((x) => x)),
    employees: json["employees"] == null ? [] : List<String>.from(json["employees"]!.map((x) => x)),
    numofmachines: json["numofmachines"],
    statusOfPayment: json["statusOfPayment"],
    activeStatus: json["activeStatus"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "admin": admin,
    "locationname": locationname,
    "address": address,
    "percentage": percentage,
    "machines": machines == null ? [] : List<dynamic>.from(machines!.map((x) => x)),
    "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x)),
    "numofmachines": numofmachines,
    "statusOfPayment": statusOfPayment,
    "activeStatus": activeStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class UpdatedRepairReport {
  String? id;
  String? employee;
  String? location;
  int? v;
  List<String>? machines;

  UpdatedRepairReport({
    this.id,
    this.employee,
    this.location,
    this.v,
    this.machines,
  });

  factory UpdatedRepairReport.fromJson(Map<String, dynamic> json) => UpdatedRepairReport(
    id: json["_id"],
    employee: json["employee"],
    location: json["location"],
    v: json["__v"],
    machines: json["machines"] == null ? [] : List<String>.from(json["machines"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "employee": employee,
    "location": location,
    "__v": v,
    "machines": machines == null ? [] : List<dynamic>.from(machines!.map((x) => x)),
  };
}
