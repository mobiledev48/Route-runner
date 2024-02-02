// To parse this JSON data, do
//
//     final resetPasswordModel = resetPasswordModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
  bool? success;
  int? code;
  Data? data;

  ResetPasswordModel({
    this.success,
    this.code,
    this.data,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
    success: json["success"],
    code: json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "data": data?.toJson(),
  };
}

class Data {
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
  List<String>? image;
  List<String>? newCollectionReports;
  String? passwordResetOtp;
  List<String>? machines;
  List<dynamic>? newRepairs;
  List<dynamic>? newServiceReports;

  Data({
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
    this.image,
    this.newCollectionReports,
    this.passwordResetOtp,
    this.machines,
    this.newRepairs,
    this.newServiceReports,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    activeEmployeeStatus: json["activeEmployeeStatus"],
    password: json["password"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    refreshToken: json["refreshToken"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    newCollectionReports: json["newCollectionReports"] == null ? [] : List<String>.from(json["newCollectionReports"]!.map((x) => x)),
    passwordResetOtp: json["passwordResetOTP"],
    machines: json["machines"] == null ? [] : List<String>.from(json["machines"]!.map((x) => x)),
    newRepairs: json["newRepairs"] == null ? [] : List<dynamic>.from(json["newRepairs"]!.map((x) => x)),
    newServiceReports: json["newServiceReports"] == null ? [] : List<dynamic>.from(json["newServiceReports"]!.map((x) => x)),
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
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "newCollectionReports": newCollectionReports == null ? [] : List<dynamic>.from(newCollectionReports!.map((x) => x)),
    "passwordResetOTP": passwordResetOtp,
    "machines": machines == null ? [] : List<dynamic>.from(machines!.map((x) => x)),
    "newRepairs": newRepairs == null ? [] : List<dynamic>.from(newRepairs!.map((x) => x)),
    "newServiceReports": newServiceReports == null ? [] : List<dynamic>.from(newServiceReports!.map((x) => x)),
  };
}
