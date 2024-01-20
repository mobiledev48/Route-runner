// To parse this JSON data, do
//
//     final getMachinesModel = getMachinesModelFromJson(jsonString);

import 'dart:convert';

LastCollectionModel lastCollectionModelFromJson(String str) => LastCollectionModel.fromJson(json.decode(str));

String lastCollectionModelToJson(LastCollectionModel data) => json.encode(data.toJson());

class LastCollectionModel {
  bool? success;
  String? message;
  LastCollectionReport? lastCollectionReport;

  LastCollectionModel({this.success, this.message, this.lastCollectionReport});

  LastCollectionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    lastCollectionReport = json['lastCollectionReport'] != null
        ? new LastCollectionReport.fromJson(json['lastCollectionReport'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.lastCollectionReport != null) {
      data['lastCollectionReport'] = this.lastCollectionReport!.toJson();
    }
    return data;
  }
}

class LastCollectionReport {
  InNumbers? inNumbers;
  InNumbers? outNumbers;
  String? sId;
  String? location;
  String? machineNumber;
  String? serialNumber;
  String? auditNumber;
  int? total;
  String? image;
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
        this.iV});

  LastCollectionReport.fromJson(Map<String, dynamic> json) {
    inNumbers = json['inNumbers'] != null
        ? new InNumbers.fromJson(json['inNumbers'])
        : null;
    outNumbers = json['outNumbers'] != null
        ? new InNumbers.fromJson(json['outNumbers'])
        : null;
    sId = json['_id'];
    location = json['location'];
    machineNumber = json['machineNumber'];
    serialNumber = json['serialNumber'];
    auditNumber = json['auditNumber'];
    total = json['total'];
    image = json['image'];
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
    data['location'] = this.location;
    data['machineNumber'] = this.machineNumber;
    data['serialNumber'] = this.serialNumber;
    data['auditNumber'] = this.auditNumber;
    data['total'] = this.total;
    data['image'] = this.image;
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
