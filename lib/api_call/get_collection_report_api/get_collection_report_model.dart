// To parse this JSON data, do
//
//     final getCollectionReportModel = getCollectionReportModelFromJson(jsonString);

import 'dart:convert';

GetCollectionReportModel getCollectionReportModelFromJson(String str) => GetCollectionReportModel.fromJson(json.decode(str));

String getCollectionReportModelToJson(GetCollectionReportModel data) => json.encode(data.toJson());

class GetCollectionReportModel {
  bool? success;
  String? message;
  List<GroupedReports>? groupedReports;
  int? totalPages;
  int? currentPage;

  GetCollectionReportModel({
    this.success,
    this.message,
    this.groupedReports,
    this.totalPages,
    this.currentPage,
  });

  factory GetCollectionReportModel.fromJson(Map<String, dynamic> json) => GetCollectionReportModel(
    success: json["success"],
    message: json["message"],
    groupedReports: json["groupedReports"] == null ? [] : List<GroupedReports>.from(json["groupedReports"]!.map((x) => GroupedReports.fromJson(x))),
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "groupedReports": groupedReports == null ? [] : List<dynamic>.from(groupedReports!.map((x) => x.toJson())),
    "totalPages": totalPages,
    "currentPage": currentPage,
  };
}

class GroupedReports {
  Location? location;
  Employee? employee;
  List<CollectionReport>? collectionReports;

  GroupedReports({
    this.location,
    this.employee,
    this.collectionReports,
  });

  factory GroupedReports.fromJson(Map<String, dynamic> json) => GroupedReports(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
    collectionReports: json["collectionReports"] == null ? [] : List<CollectionReport>.from(json["collectionReports"]!.map((x) => CollectionReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "employee": employee?.toJson(),
    "collectionReports": collectionReports == null ? [] : List<dynamic>.from(collectionReports!.map((x) => x.toJson())),
  };
}

class CollectionReport {
  Numbers? inNumbers;
  Numbers? outNumbers;
  String? id;
  Location? location;
  String? machineNumber;
  String? serialNumber;
  String? auditNumber;
  int? total;
  List<String>? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CollectionReport({
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

  factory CollectionReport.fromJson(Map<String, dynamic> json) => CollectionReport(
    inNumbers: json["inNumbers"] == null ? null : Numbers.fromJson(json["inNumbers"]),
    outNumbers: json["outNumbers"] == null ? null : Numbers.fromJson(json["outNumbers"]),
    id: json["_id"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    machineNumber: json["machineNumber"],
    serialNumber: json["serialNumber"],
    auditNumber: json["auditNumber"],
    total: json["total"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
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
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
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
