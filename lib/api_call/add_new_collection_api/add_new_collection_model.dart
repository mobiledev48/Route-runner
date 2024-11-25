// To parse this JSON data, do
//
//     final addNewRepairModel = addNewRepairModelFromJson(jsonString);

import 'dart:convert';

AddNewCollectionModel addNewCollectionModelFromJson(String str) => AddNewCollectionModel.fromJson(json.decode(str));

String addNewCollectionModelToJson(AddNewCollectionModel data) => json.encode(data.toJson());

class AddNewCollectionModel {
  bool? success;
  String? message;
  Data? data;

  AddNewCollectionModel({this.success, this.message, this.data});

  AddNewCollectionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Employee? employee;
  NewCollectionReport? newCollectionReport;
  UpdatedLocation? updatedLocation;

  Data({this.employee, this.newCollectionReport, this.updatedLocation});

  Data.fromJson(Map<String, dynamic> json) {
    employee = json['employee'] != null
        ? Employee.fromJson(json['employee'])
        : null;
    newCollectionReport = json['newCollectionReport'] != null
        ? NewCollectionReport.fromJson(json['newCollectionReport'])
        : null;
    updatedLocation = json['updatedLocation'] != null
        ? UpdatedLocation.fromJson(json['updatedLocation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employee != null) {
      data['employee'] = employee!.toJson();
    }
    if (newCollectionReport != null) {
      data['newCollectionReport'] = newCollectionReport!.toJson();
    }
    if (updatedLocation != null) {
      data['updatedLocation'] = updatedLocation!.toJson();
    }
    return data;
  }
}

class Employee {
  String? sId;
  String? firstname;
  String? lastname;
  int? phone;
  String? email;
  String? address;
  String? activeEmployeeStatus;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? refreshToken;
  List<String>? newServiceReports;
  List<String>? newRepairs;
  List<String>? newCollectionReports;

  Employee(
      {this.sId,
        this.firstname,
        this.lastname,
        this.phone,
        this.email,
        this.address,
        this.activeEmployeeStatus,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.refreshToken,
        this.newServiceReports,
        this.newRepairs,
        this.newCollectionReports});

  Employee.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    activeEmployeeStatus = json['activeEmployeeStatus'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    refreshToken = json['refreshToken'];
    newServiceReports = json['newServiceReports'].cast<String>();
    newRepairs = json['newRepairs'].cast<String>();
    newCollectionReports = json['newCollectionReports'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['activeEmployeeStatus'] = activeEmployeeStatus;
    data['password'] = password;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['refreshToken'] = refreshToken;
    data['newServiceReports'] = newServiceReports;
    data['newRepairs'] = newRepairs;
    data['newCollectionReports'] = newCollectionReports;
    return data;
  }
}

class NewCollectionReport {
  String? location;
  String? machineNumber;
  String? serialNumber;
  String? auditNumber;
  InNumbers? inNumbers;
  InNumbers? outNumbers;
  int? total;
  String? image;
  String? sId;
  int? iV;

  NewCollectionReport(
      {this.location,
        this.machineNumber,
        this.serialNumber,
        this.auditNumber,
        this.inNumbers,
        this.outNumbers,
        this.total,
        this.image,
        this.sId,
        this.iV});

  NewCollectionReport.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    machineNumber = json['machineNumber'];
    serialNumber = json['serialNumber'];
    auditNumber = json['auditNumber'];
    inNumbers = json['inNumbers'] != null
        ? InNumbers.fromJson(json['inNumbers'])
        : null;
    outNumbers = json['outNumbers'] != null
        ? InNumbers.fromJson(json['outNumbers'])
        : null;
    total = json['total'];
    image = json['image'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['machineNumber'] = machineNumber;
    data['serialNumber'] = serialNumber;
    data['auditNumber'] = auditNumber;
    if (inNumbers != null) {
      data['inNumbers'] = inNumbers!.toJson();
    }
    if (outNumbers != null) {
      data['outNumbers'] = outNumbers!.toJson();
    }
    data['total'] = total;
    data['image'] = image;
    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}

class InNumbers {
  int? previous;
  int? current;

  InNumbers({this.previous, this.current});

  InNumbers.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['previous'] = previous;
    data['current'] = current;
    return data;
  }
}

class UpdatedLocation {
  String? sId;
  String? admin;
  String? locationname;
  String? address;
  String? percentage;
  List<String>? machines;
  List<String>? employees;
  int? numofmachines;
  String? activeStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? statusOfPayment;

  UpdatedLocation(
      {this.sId,
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
        this.iV,
        this.statusOfPayment});

  UpdatedLocation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    admin = json['admin'];
    locationname = json['locationname'];
    address = json['address'];
    percentage = json['percentage'];
    machines = json['machines'].cast<String>();
    employees = json['employees'].cast<String>();
    numofmachines = json['numofmachines'];
    activeStatus = json['activeStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    statusOfPayment = json['statusOfPayment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['admin'] = admin;
    data['locationname'] = locationname;
    data['address'] = address;
    data['percentage'] = percentage;
    data['machines'] = machines;
    data['employees'] = employees;
    data['numofmachines'] = numofmachines;
    data['activeStatus'] = activeStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['statusOfPayment'] = statusOfPayment;
    return data;
  }
}
