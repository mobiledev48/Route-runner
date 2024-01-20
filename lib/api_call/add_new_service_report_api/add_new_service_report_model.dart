// To parse this JSON data, do
//
//     final newServiceReportModel = newServiceReportModelFromJson(jsonString);

import 'dart:convert';

NewServiceReportModel newServiceReportModelFromJson(String str) => NewServiceReportModel.fromJson(json.decode(str));

String newServiceReportModelToJson(NewServiceReportModel data) => json.encode(data.toJson());

class NewServiceReportModel {
  bool? success;
  String? message;
  Employee? employee;
  NewServiceReports? newServiceReports;

  NewServiceReportModel({
     this.success,
     this.message,
     this.employee,
     this.newServiceReports,
  });

  factory NewServiceReportModel.fromJson(Map<String, dynamic> json) => NewServiceReportModel(
    success: json["success"],
    message: json["message"],
    employee: Employee.fromJson(json["employee"]),
    newServiceReports: NewServiceReports.fromJson(json["newServiceReports"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "employee": employee?.toJson(),
    "newServiceReports": newServiceReports?.toJson(),
  };
}

class Employee {
  String? id;
  String? firstname;
  String? lastname;
  int? phone;
  String? email;
  String? address;
  String? activeEmployeeStatus;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? refreshToken;
  List<String>? newServiceReports;
  List<String>? newRepairs;
  List<String>? newCollectionReports;

  Employee({
     this.id,
     this.firstname,
     this.lastname,
     this.phone,
     this.email,
     this.address,
     this.activeEmployeeStatus,
     this.password,
     this.createdAt,
     this.updatedAt,
     this.v,
     this.refreshToken,
     this.newServiceReports,
     this.newRepairs,
     this.newCollectionReports,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    activeEmployeeStatus: json["activeEmployeeStatus"],
    password: json["password"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    refreshToken: json["refreshToken"],
    newServiceReports: List<String>.from(json["newServiceReports"].map((x) => x)),
    newRepairs: List<String>.from(json["newRepairs"].map((x) => x)),
    newCollectionReports: List<String>.from(json["newCollectionReports"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstname": firstname,
    "lastname": lastname,
    "phone": phone,
    "email": email,
    "address": address,
    "activeEmployeeStatus": activeEmployeeStatus,
    "password": password,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "refreshToken": refreshToken,
    "newServiceReports": List<dynamic>.from(newServiceReports!.map((x) => x)),
    "newRepairs": List<dynamic>.from(newRepairs!.map((x) => x)),
    "newCollectionReports": List<dynamic>.from(newCollectionReports!.map((x) => x)),
  };
}

class NewServiceReports {
  String machineNumber;
  String serialNumber;
  String auditNumber;
  DateTime date;
  String time;
  String employeeName;
  String serviceRequested;
  String image;
  String id;
  int v;

  NewServiceReports({
    required this.machineNumber,
    required this.serialNumber,
    required this.auditNumber,
    required this.date,
    required this.time,
    required this.employeeName,
    required this.serviceRequested,
    required this.image,
    required this.id,
    required this.v,
  });

  factory NewServiceReports.fromJson(Map<String, dynamic> json) => NewServiceReports(
    machineNumber: json["machineNumber"],
    serialNumber: json["serialNumber"],
    auditNumber: json["auditNumber"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    employeeName: json["employeeName"],
    serviceRequested: json["serviceRequested"],
    image: json["image"],
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "machineNumber": machineNumber,
    "serialNumber": serialNumber,
    "auditNumber": auditNumber,
    "date": date.toIso8601String(),
    "time": time,
    "employeeName": employeeName,
    "serviceRequested": serviceRequested,
    "image": image,
    "_id": id,
    "__v": v,
  };
}
