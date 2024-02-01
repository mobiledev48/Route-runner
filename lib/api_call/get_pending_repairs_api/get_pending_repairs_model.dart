// To parse this JSON data, do
//
//     final getPendingRepairsModel = getPendingRepairsModelFromJson(jsonString);

import 'dart:convert';

GetPendingRepairsModel getPendingRepairsModelFromJson(String str) => GetPendingRepairsModel.fromJson(json.decode(str));

String getPendingRepairsModelToJson(GetPendingRepairsModel data) => json.encode(data.toJson());

class GetPendingRepairsModel {
  bool? success;
  String? message;
  List<Datum>? data;

  GetPendingRepairsModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetPendingRepairsModel.fromJson(Map<String, dynamic> json) => GetPendingRepairsModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? employee;
  Location? location;
  int? v;
  List<Machine>? machines;

  Datum({
    this.id,
    this.employee,
    this.location,
    this.v,
    this.machines,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    employee: json["employee"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    v: json["__v"],
    machines: json["machines"] == null ? [] : List<Machine>.from(json["machines"]!.map((x) => Machine.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "employee": employee,
    "location": location?.toJson(),
    "__v": v,
    "machines": machines == null ? [] : List<dynamic>.from(machines!.map((x) => x.toJson())),
  };
}

class Location {
  String? id;
  String? locationname;
  int? numofmachines;

  Location({
    this.id,
    this.locationname,
    this.numofmachines,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["_id"],
    locationname: json["locationname"],
    numofmachines: json["numofmachines"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "locationname": locationname,
    "numofmachines": numofmachines,
  };
}

class Machine {
  Numbers? inNumbers;
  Numbers? outNumbers;
  String? id;
  String? machineNumber;
  String? serialNumber;
  String? initialNumber;
  String? currentNumber;
  String? gameName;
  String? activeMachineStatus;
  List<String>? employees;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<String>? image;
  String? total;
  DateTime? date;
  List<String>? imageOfRepair;
  String? issue;
  String? reporterName;
  String? statusOfRepair;
  String? time;
  String? location;

  Machine({
    this.inNumbers,
    this.outNumbers,
    this.id,
    this.machineNumber,
    this.serialNumber,
    this.initialNumber,
    this.currentNumber,
    this.gameName,
    this.activeMachineStatus,
    this.employees,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
    this.total,
    this.date,
    this.imageOfRepair,
    this.issue,
    this.reporterName,
    this.statusOfRepair,
    this.time,
    this.location,
  });

  factory Machine.fromJson(Map<String, dynamic> json) => Machine(
    inNumbers: json["inNumbers"] == null ? null : Numbers.fromJson(json["inNumbers"]),
    outNumbers: json["outNumbers"] == null ? null : Numbers.fromJson(json["outNumbers"]),
    id: json["_id"],
    machineNumber: json["machineNumber"],
    serialNumber: json["serialNumber"],
    initialNumber: json["initialNumber"],
    currentNumber: json["currentNumber"],
    gameName: json["gameName"],
    activeMachineStatus: json["activeMachineStatus"],
    employees: json["employees"] == null ? [] : List<String>.from(json["employees"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    total: json["total"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    imageOfRepair: json["imageOfRepair"] == null ? [] : List<String>.from(json["imageOfRepair"]!.map((x) => x)),
    issue: json["issue"],
    reporterName: json["reporterName"],
    statusOfRepair: json["statusOfRepair"],
    time: json["time"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "inNumbers": inNumbers?.toJson(),
    "outNumbers": outNumbers?.toJson(),
    "_id": id,
    "machineNumber": machineNumber,
    "serialNumber": serialNumber,
    "initialNumber": initialNumber,
    "currentNumber": currentNumber,
    "gameName": gameName,
    "activeMachineStatus": activeMachineStatus,
    "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "total": total,
    "date": date?.toIso8601String(),
    "imageOfRepair": imageOfRepair == null ? [] : List<dynamic>.from(imageOfRepair!.map((x) => x)),
    "issue": issue,
    "reporterName": reporterName,
    "statusOfRepair": statusOfRepair,
    "time": time,
    "location": location,
  };
}

class Numbers {
  int? current;
  int? previous;

  Numbers({
    this.current,
    this.previous,
  });

  factory Numbers.fromJson(Map<String, dynamic> json) => Numbers(
    current: json["current"],
    previous: json["previous"],
  );

  Map<String, dynamic> toJson() => {
    "current": current,
    "previous": previous,
  };
}
