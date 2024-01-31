// To parse this JSON data, do
//
//     final getLocationModel = getLocationModelFromJson(jsonString);

import 'dart:convert';

GetLocationModel getLocationModelFromJson(String str) => GetLocationModel.fromJson(json.decode(str));

String getLocationModelToJson(GetLocationModel data) => json.encode(data.toJson());

class GetLocationModel {
  bool? success;
  List<LocationsData>? locations;

  GetLocationModel({
    this.success,
    this.locations,
  });

  factory GetLocationModel.fromJson(Map<String, dynamic> json) => GetLocationModel(
    success: json["success"],
    locations: json["locations"] == null ? [] : List<LocationsData>.from(json["locations"]!.map((x) => LocationsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x.toJson())),
  };
}

class LocationsData {
  String? id;
  Admin? admin;
  String? locationname;
  String? address;
  String? percentage;
  List<Machine>? machines;
  List<Admin>? employees;
  int? numofmachines;
  String? activeStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? statusOfPayment;

  LocationsData({
    this.id,
    this.admin,
    this.locationname,
    this.address,
    this.percentage,
    this.machines,
    this.employees,
    this.numofmachines,
    this.activeStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.statusOfPayment,
  });

  factory LocationsData.fromJson(Map<String, dynamic> json) => LocationsData(
    id: json["_id"],
    admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
    locationname: json["locationname"],
    address: json["address"],
    percentage: json["percentage"],
    machines: json["machines"] == null ? [] : List<Machine>.from(json["machines"]!.map((x) => Machine.fromJson(x))),
    employees: json["employees"] == null ? [] : List<Admin>.from(json["employees"]!.map((x) => Admin.fromJson(x))),
    numofmachines: json["numofmachines"],
    activeStatus: json["activeStatus"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    statusOfPayment: json["statusOfPayment"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "admin": admin?.toJson(),
    "locationname": locationname,
    "address": address,
    "percentage": percentage,
    "machines": machines == null ? [] : List<dynamic>.from(machines!.map((x) => x.toJson())),
    "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x.toJson())),
    "numofmachines": numofmachines,
    "activeStatus": activeStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "statusOfPayment": statusOfPayment,
  };
}

class Admin {
  String? id;
  String? firstname;
  String? lastname;

  Admin({
    this.id,
    this.firstname,
    this.lastname,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstname": firstname,
    "lastname": lastname,
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
