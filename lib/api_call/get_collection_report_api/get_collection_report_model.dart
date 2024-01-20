// To parse this JSON data, do
//
//     final getMachinesModel = getMachinesModelFromJson(jsonString);

import 'dart:convert';

GetCollectionReportModel getCollectionReportModelFromJson(String str) => GetCollectionReportModel.fromJson(json.decode(str));

String getCollectionReportModelToJson(GetCollectionReportModel data) => json.encode(data.toJson());

class GetCollectionReportModel {
  bool? success;
  String? message;
  List<GroupedReports>? groupedReports;
  int? totalPages;
  int? currentPage;

  GetCollectionReportModel(
      {this.success,
        this.message,
        this.groupedReports,
        this.totalPages,
        this.currentPage});

  GetCollectionReportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['groupedReports'] != null) {
      groupedReports = <GroupedReports>[];
      json['groupedReports'].forEach((v) {
        groupedReports!.add(new GroupedReports.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.groupedReports != null) {
      data['groupedReports'] =
          this.groupedReports!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    return data;
  }
}

class GroupedReports {
  Location? location;
  Employee? employee;
  List<CollectionReports>? collectionReports;

  GroupedReports({this.location, this.employee, this.collectionReports});

  GroupedReports.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    if (json['collectionReports'] != null) {
      collectionReports = <CollectionReports>[];
      json['collectionReports'].forEach((v) {
        collectionReports!.add(new CollectionReports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    if (this.collectionReports != null) {
      data['collectionReports'] =
          this.collectionReports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? sId;
  String? locationname;
  String? address;
  String? createdAt;

  Location({this.sId, this.locationname, this.address, this.createdAt});

  Location.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    locationname = json['locationname'];
    address = json['address'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['locationname'] = this.locationname;
    data['address'] = this.address;
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

class CollectionReports {
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

  CollectionReports(
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

  CollectionReports.fromJson(Map<String, dynamic> json) {
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
