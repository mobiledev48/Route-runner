// To parse this JSON data, do
//
//     final gerRecentCollectionModel = gerRecentCollectionModelFromJson(jsonString);

import 'dart:convert';

GerRecentCollectionModel gerRecentCollectionModelFromJson(String str) => GerRecentCollectionModel.fromJson(json.decode(str));

String gerRecentCollectionModelToJson(GerRecentCollectionModel data) => json.encode(data.toJson());

class GerRecentCollectionModel {
  bool? success;
  String? message;
  Data? data;

  GerRecentCollectionModel({
    this.success,
    this.message,
    this.data,
  });

  factory GerRecentCollectionModel.fromJson(Map<String, dynamic> json) => GerRecentCollectionModel(
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
  String? id;
  String? employee;
  Location? location;
  int? v;
  DateTime? createdAt;
  List<Machine>? machines;
  DateTime? updatedAt;

  Data({
    this.id,
    this.employee,
    this.location,
    this.v,
    this.createdAt,
    this.machines,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    employee: json["employee"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    v: json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    machines: json["machines"] == null ? [] : List<Machine>.from(json["machines"]!.map((x) => Machine.fromJson(x))),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "employee": employee,
    "location": location?.toJson(),
    "__v": v,
    "createdAt": createdAt?.toIso8601String(),
    "machines": machines == null ? [] : List<dynamic>.from(machines!.map((x) => x.toJson())),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Location {
  String? id;
  String? locationname;
  String? address;
  int? numofmachines;

  Location({
    this.id,
    this.locationname,
    this.address,
    this.numofmachines,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["_id"],
    locationname: json["locationname"],
    address: json["address"],
    numofmachines: json["numofmachines"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "locationname": locationname,
    "address": address,
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
  String? location;
  String? total;

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
    this.location,
    this.total,
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
    location: json["location"],
    total: json["total"],
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
    "location": location,
    "total": total,
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
