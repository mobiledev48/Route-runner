// To parse this JSON data, do
//
//     final getMachinesModel = getMachinesModelFromJson(jsonString);

import 'dart:convert';

GetMachinesModel getMachinesModelFromJson(String str) => GetMachinesModel.fromJson(json.decode(str));

String getMachinesModelToJson(GetMachinesModel data) => json.encode(data.toJson());

class GetMachinesModel {
  bool? success;
  List<MachinesLocations>? locations;
  List<Machines>? machines;
  int? currentPage;
  int? totalLocationPages;
  int? totalMachinePages;

  GetMachinesModel(
      {this.success,
        this.locations,
        this.machines,
        this.currentPage,
        this.totalLocationPages,
        this.totalMachinePages});

  GetMachinesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['locations'] != null) {
      locations = <MachinesLocations>[];
      json['locations'].forEach((v) {
        locations!.add(new MachinesLocations.fromJson(v));
      });
    }
    if (json['machines'] != null) {
      machines = <Machines>[];
      json['machines'].forEach((v) {
        machines!.add(new Machines.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalLocationPages = json['totalLocationPages'];
    totalMachinePages = json['totalMachinePages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    if (this.machines != null) {
      data['machines'] = this.machines!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    data['totalLocationPages'] = this.totalLocationPages;
    data['totalMachinePages'] = this.totalMachinePages;
    return data;
  }
}

class MachinesLocations {
  String? sId;
  String? admin;
  String? locationname;
  String? address;
  String? percentage;
  List<Machines>? machines;
  List<String>? employees;
  int? numofmachines;
  String? activeStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MachinesLocations(
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
        this.iV});

  MachinesLocations.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    admin = json['admin'];
    locationname = json['locationname'];
    address = json['address'];
    percentage = json['percentage'];
    if (json['machines'] != null) {
      machines = <Machines>[];
      json['machines'].forEach((v) {
        machines!.add(new Machines.fromJson(v));
      });
    }
    employees = json['employees'].cast<String>();
    numofmachines = json['numofmachines'];
    activeStatus = json['activeStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['admin'] = this.admin;
    data['locationname'] = this.locationname;
    data['address'] = this.address;
    data['percentage'] = this.percentage;
    if (this.machines != null) {
      data['machines'] = this.machines!.map((v) => v.toJson()).toList();
    }
    data['employees'] = this.employees;
    data['numofmachines'] = this.numofmachines;
    data['activeStatus'] = this.activeStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Machines {
  String? initialNumber;
  String? defaultNumber;
  String? sId;
  String? machineNumber;
  String? serialNumber;
  String? activeMachineStatus;
  List<String>? employees;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Machines(
      {this.initialNumber,
        this.defaultNumber,
        this.sId,
        this.machineNumber,
        this.serialNumber,
        this.activeMachineStatus,
        this.employees,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Machines.fromJson(Map<String, dynamic> json) {
    initialNumber = json['initialNumber'];
    defaultNumber = json['defaultNumber'];
    sId = json['_id'];
    machineNumber = json['machineNumber'];
    serialNumber = json['serialNumber'];
    activeMachineStatus = json['activeMachineStatus'];
    employees = json['employees'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['initialNumber'] = this.initialNumber;
    data['defaultNumber'] = this.defaultNumber;
    data['_id'] = this.sId;
    data['machineNumber'] = this.machineNumber;
    data['serialNumber'] = this.serialNumber;
    data['activeMachineStatus'] = this.activeMachineStatus;
    data['employees'] = this.employees;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class MachinesData {
  String? initialNumber;
  String? defaultNumber;
  String? sId;
  String? machineNumber;
  String? serialNumber;
  String? activeMachineStatus;
  List<Employees>? employees;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MachinesData(
      {this.initialNumber,
        this.defaultNumber,
        this.sId,
        this.machineNumber,
        this.serialNumber,
        this.activeMachineStatus,
        this.employees,
        this.createdAt,
        this.updatedAt,
        this.iV});

  MachinesData.fromJson(Map<String, dynamic> json) {
    initialNumber = json['initialNumber'];
    defaultNumber = json['defaultNumber'];
    sId = json['_id'];
    machineNumber = json['machineNumber'];
    serialNumber = json['serialNumber'];
    activeMachineStatus = json['activeMachineStatus'];
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['initialNumber'] = this.initialNumber;
    data['defaultNumber'] = this.defaultNumber;
    data['_id'] = this.sId;
    data['machineNumber'] = this.machineNumber;
    data['serialNumber'] = this.serialNumber;
    data['activeMachineStatus'] = this.activeMachineStatus;
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Employees {
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

  Employees(
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

  Employees.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['activeEmployeeStatus'] = this.activeEmployeeStatus;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['refreshToken'] = this.refreshToken;
    data['newServiceReports'] = this.newServiceReports;
    data['newRepairs'] = this.newRepairs;
    data['newCollectionReports'] = this.newCollectionReports;
    return data;
  }
}
