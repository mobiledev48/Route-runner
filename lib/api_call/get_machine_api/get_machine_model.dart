// To parse this JSON data, do
//
//     final getMachinesModel = getMachinesModelFromJson(jsonString);

import 'dart:convert';

GetMachinesModel getMachinesModelFromJson(String str) => GetMachinesModel.fromJson(json.decode(str));

String getMachinesModelToJson(GetMachinesModel data) => json.encode(data.toJson());

class GetMachinesModel {
  bool? success;
  List<LocationDataMachine>? locations;
  int? currentPage;
  int? totalLocationPages;

  GetMachinesModel({
    this.success,
    this.locations,
    this.currentPage,
    this.totalLocationPages,
  });

  factory GetMachinesModel.fromJson(Map<String, dynamic> json) => GetMachinesModel(
    success: json["success"],
    locations: json["locations"] == null ? [] : List<LocationDataMachine>.from(json["locations"]!.map((x) => LocationDataMachine.fromJson(x))),
    currentPage: json["currentPage"],
    totalLocationPages: json["totalLocationPages"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x.toJson())),
    "currentPage": currentPage,
    "totalLocationPages": totalLocationPages,
  };
}

class LocationDataMachine {
  String? id;
  String? admin;
  String? locationname;
  String? address;
  String? percentage;
  List<Machine>? machines;
  List<String>? employees;
  int? numofmachines;
  String? activeStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? statusOfPayment;

  LocationDataMachine({
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

  factory LocationDataMachine.fromJson(Map<String, dynamic> json) => LocationDataMachine(
    id: json["_id"],
    admin: json["admin"],
    locationname: json["locationname"],
    address: json["address"],
    percentage: json["percentage"],
    machines: json["machines"] == null ? [] : List<Machine>.from(json["machines"]!.map((x) => Machine.fromJson(x))),
    employees: json["employees"] == null ? [] : List<String>.from(json["employees"]!.map((x) => x)),
    numofmachines: json["numofmachines"],
    activeStatus: json["activeStatus"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    statusOfPayment: json["statusOfPayment"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "admin": admin,
    "locationname": locationname,
    "address": address,
    "percentage": percentage,
    "machines": machines == null ? [] : List<dynamic>.from(machines!.map((x) => x.toJson())),
    "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x)),
    "numofmachines": numofmachines,
    "activeStatus": activeStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "statusOfPayment": statusOfPayment,
  };
}

class Machine {
  String? id;
  String? machineNumber;
  String? serialNumber;
  String? initialNumber;
  String? currentNumber;
  String? gameName;
  String? activeMachineStatus;
  List<Employee>? employees;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Machine({
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
  });

  factory Machine.fromJson(Map<String, dynamic> json) => Machine(
    id: json["_id"],
    machineNumber: json["machineNumber"],
    serialNumber: json["serialNumber"],
    initialNumber: json["initialNumber"],
    currentNumber: json["currentNumber"],
    gameName: json["gameName"],
    activeMachineStatus: json["activeMachineStatus"],
    employees: json["employees"] == null ? [] : List<Employee>.from(json["employees"]!.map((x) => Employee.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "machineNumber": machineNumber,
    "serialNumber": serialNumber,
    "initialNumber": initialNumber,
    "currentNumber": currentNumber,
    "gameName": gameName,
    "activeMachineStatus": activeMachineStatus,
    "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Employee {
  String? id;
  String? firstname;
  String? lastname;

  Employee({
    this.id,
    this.firstname,
    this.lastname,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
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
