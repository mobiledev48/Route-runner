// To parse this JSON data, do
//
//     final getMachinesModel = getMachinesModelFromJson(jsonString);

import 'dart:convert';

GerRecentCollectionModel gerRecentCollectionModelFromJson(String str) => GerRecentCollectionModel.fromJson(json.decode(str));

String gerRecentCollectionModelToJson(GerRecentCollectionModel data) => json.encode(data.toJson());

class GerRecentCollectionModel {
  bool? success;
  String? message;
  List<LastThreeCollectionReports>? lastThreeCollectionReports;

  GerRecentCollectionModel(
      {this.success, this.message, this.lastThreeCollectionReports});

  GerRecentCollectionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['lastThreeCollectionReports'] != null) {
      lastThreeCollectionReports = <LastThreeCollectionReports>[];
      json['lastThreeCollectionReports'].forEach((v) {
        lastThreeCollectionReports!
            .add(new LastThreeCollectionReports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.lastThreeCollectionReports != null) {
      data['lastThreeCollectionReports'] =
          this.lastThreeCollectionReports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LastThreeCollectionReports {
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

  LastThreeCollectionReports(
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

  LastThreeCollectionReports.fromJson(Map<String, dynamic> json) {
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

