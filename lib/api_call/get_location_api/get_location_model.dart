// To parse this JSON data, do
//
//     final getLocationModel = getLocationModelFromJson(jsonString);

import 'dart:convert';

GetLocationModel getLocationModelFromJson(String str) => GetLocationModel.fromJson(json.decode(str));

String getLocationModelToJson(GetLocationModel data) => json.encode(data.toJson());

class GetLocationModel {
  bool? success;
  List<LocationsData>? locations;
  int? totalPages;
  int? currentPage;

  GetLocationModel(
      {this.success, this.locations, this.totalPages, this.currentPage});

  GetLocationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['locations'] != null) {
      locations = <LocationsData>[];
      json['locations'].forEach((v) {
        locations!.add(new LocationsData.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    return data;
  }
}

class LocationsData {
  String? sId;
  Admin? admin;
  String? locationname;
  String? address;
  String? percentage;
  List<Machines>? machines;
  List<Admin>? employees;
  int? numofmachines;
  String? activeStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? statusOfPayment;

  LocationsData(
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

  LocationsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    locationname = json['locationname'];
    address = json['address'];
    percentage = json['percentage'];
    if (json['machines'] != null) {
      machines = <Machines>[];
      json['machines'].forEach((v) {
        machines!.add(new Machines.fromJson(v));
      });
    }
    if (json['employees'] != null) {
      employees = <Admin>[];
      json['employees'].forEach((v) {
        employees!.add(new Admin.fromJson(v));
      });
    }
    numofmachines = json['numofmachines'];
    activeStatus = json['activeStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    statusOfPayment = json['statusOfPayment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.admin != null) {
      data['admin'] = this.admin!.toJson();
    }
    data['locationname'] = this.locationname;
    data['address'] = this.address;
    data['percentage'] = this.percentage;
    if (this.machines != null) {
      data['machines'] = this.machines!.map((v) => v.toJson()).toList();
    }
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    data['numofmachines'] = this.numofmachines;
    data['activeStatus'] = this.activeStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['statusOfPayment'] = this.statusOfPayment;
    return data;
  }
}

class Admin {
  String? sId;
  String? firstname;
  String? lastname;

  Admin({this.sId, this.firstname, this.lastname});

  Admin.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    return data;
  }
}

class Machines {
  String? sId;

  Machines({this.sId});

  Machines.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    return data;
  }
}
