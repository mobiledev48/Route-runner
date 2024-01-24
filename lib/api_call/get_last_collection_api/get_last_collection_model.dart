// To parse this JSON data, do
//
//     final getMachinesModel = getMachinesModelFromJson(jsonString);

import 'dart:convert';

LastCollectionModel lastCollectionModelFromJson(String str) => LastCollectionModel.fromJson(json.decode(str));

String lastCollectionModelToJson(LastCollectionModel data) => json.encode(data.toJson());

class LastCollectionModel {
  bool? success;
  String? message;
  LastCollection? lastCollection;

  LastCollectionModel({this.success, this.message, this.lastCollection});

  LastCollectionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    lastCollection = json['lastCollection'] != null
        ? new LastCollection.fromJson(json['lastCollection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.lastCollection != null) {
      data['lastCollection'] = this.lastCollection!.toJson();
    }
    return data;
  }
}

class LastCollection {
  Location? location;
  Employee? employee;
  LastCollectionReport? lastCollectionReport;

  LastCollection({this.location, this.employee, this.lastCollectionReport});

  LastCollection.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    lastCollectionReport = json['lastCollectionReport'] != null
        ? new LastCollectionReport.fromJson(json['lastCollectionReport'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    if (this.lastCollectionReport != null) {
      data['lastCollectionReport'] = this.lastCollectionReport!.toJson();
    }
    return data;
  }
}

class Location {
  String? sId;
  String? locationname;
  String? address;
  int? numofmachines;
  String? createdAt;

  Location(
      {this.sId,
        this.locationname,
        this.address,
        this.numofmachines,
        this.createdAt});

  Location.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    locationname = json['locationname'];
    address = json['address'];
    numofmachines = json['numofmachines'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['locationname'] = this.locationname;
    data['address'] = this.address;
    data['numofmachines'] = this.numofmachines;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Employee {
  String? firstname;
  String? lastname;

  Employee({this.firstname, this.lastname});

  Employee.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    return data;
  }
}

class LastCollectionReport {
  InNumbers? inNumbers;
  InNumbers? outNumbers;
  String? sId;
  Location? location;
  String? machineNumber;
  String? serialNumber;
  String? auditNumber;
  int? total;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  LastCollectionReport(
      {this.inNumbers,
        this.outNumbers,
        this.sId,
        this.location,
        this.machineNumber,
        this.serialNumber,
        this.auditNumber,
        this.total,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.iV});

  LastCollectionReport.fromJson(Map<String, dynamic> json) {
    inNumbers = json['inNumbers'] != null
        ? new InNumbers.fromJson(json['inNumbers'])
        : null;
    outNumbers = json['outNumbers'] != null
        ? new InNumbers.fromJson(json['outNumbers'])
        : null;
    sId = json['_id'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    machineNumber = json['machineNumber'];
    serialNumber = json['serialNumber'];
    auditNumber = json['auditNumber'];
    total = json['total'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inNumbers != null) {
      data['inNumbers'] = this.inNumbers!.toJson();
    }
    if (this.outNumbers != null) {
      data['outNumbers'] = this.outNumbers!.toJson();
    }
    data['_id'] = this.sId;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['machineNumber'] = this.machineNumber;
    data['serialNumber'] = this.serialNumber;
    data['auditNumber'] = this.auditNumber;
    data['total'] = this.total;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['previous'] = this.previous;
    data['current'] = this.current;
    return data;
  }
}
