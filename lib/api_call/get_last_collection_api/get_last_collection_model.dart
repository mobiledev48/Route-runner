// To parse this JSON data, do
//
//     final lastCollectionModel = lastCollectionModelFromJson(jsonString);

import 'dart:convert';

LastCollectionModel lastCollectionModelFromJson(String str) => LastCollectionModel.fromJson(json.decode(str));

String lastCollectionModelToJson(LastCollectionModel data) => json.encode(data.toJson());

class LastCollectionModel {
  bool? success;
  String? message;
  LastCollection? lastCollection;

  LastCollectionModel({
    this.success,
    this.message,
    this.lastCollection,
  });

  factory LastCollectionModel.fromJson(Map<String, dynamic> json) => LastCollectionModel(
    success: json["success"],
    message: json["message"],
    lastCollection: json["lastCollection"] == null ? null : LastCollection.fromJson(json["lastCollection"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "lastCollection": lastCollection?.toJson(),
  };
}

class LastCollection {
  Location? location;
  Employee? employee;
  LastCollectionReport? lastCollectionReport;

  LastCollection({
    this.location,
    this.employee,
    this.lastCollectionReport,
  });

  factory LastCollection.fromJson(Map<String, dynamic> json) => LastCollection(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
    lastCollectionReport: json["lastCollectionReport"] == null ? null : LastCollectionReport.fromJson(json["lastCollectionReport"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "employee": employee?.toJson(),
    "lastCollectionReport": lastCollectionReport?.toJson(),
  };
}

class Employee {
  String? firstname;
  String? lastname;

  Employee({
    this.firstname,
    this.lastname,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
  };
}

class LastCollectionReport {
  Numbers? inNumbers;
  Numbers? outNumbers;
  String? id;
  Location? location;
  String? machineNumber;
  String? serialNumber;
  String? auditNumber;
  int? total;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  LastCollectionReport({
    this.inNumbers,
    this.outNumbers,
    this.id,
    this.location,
    this.machineNumber,
    this.serialNumber,
    this.auditNumber,
    this.total,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory LastCollectionReport.fromJson(Map<String, dynamic> json) => LastCollectionReport(
    inNumbers: json["inNumbers"] == null ? null : Numbers.fromJson(json["inNumbers"]),
    outNumbers: json["outNumbers"] == null ? null : Numbers.fromJson(json["outNumbers"]),
    id: json["_id"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    machineNumber: json["machineNumber"],
    serialNumber: json["serialNumber"],
    auditNumber: json["auditNumber"],
    total: json["total"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "inNumbers": inNumbers?.toJson(),
    "outNumbers": outNumbers?.toJson(),
    "_id": id,
    "location": location?.toJson(),
    "machineNumber": machineNumber,
    "serialNumber": serialNumber,
    "auditNumber": auditNumber,
    "total": total,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Numbers {
  int? previous;
  int? current;

  Numbers({
    this.previous,
    this.current,
  });

  factory Numbers.fromJson(Map<String, dynamic> json) => Numbers(
    previous: json["previous"],
    current: json["current"],
  );

  Map<String, dynamic> toJson() => {
    "previous": previous,
    "current": current,
  };
}

class Location {
  String? id;
  String? locationname;
  String? address;
  int? numofmachines;
  DateTime? createdAt;

  Location({
    this.id,
    this.locationname,
    this.address,
    this.numofmachines,
    this.createdAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["_id"],
    locationname: json["locationname"],
    address: json["address"],
    numofmachines: json["numofmachines"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "locationname": locationname,
    "address": address,
    "numofmachines": numofmachines,
    "createdAt": createdAt?.toIso8601String(),
  };
}
