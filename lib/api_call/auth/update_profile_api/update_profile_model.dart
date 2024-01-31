// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  bool? success;
  String? message;
  UpdatedFields? updatedFields;
  int? statusCode;

  UpdateProfileModel({
    this.success,
    this.message,
    this.updatedFields,
    this.statusCode,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    success: json["success"],
    message: json["message"],
    updatedFields: json["updatedFields"] == null ? null : UpdatedFields.fromJson(json["updatedFields"]),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "updatedFields": updatedFields?.toJson(),
    "statusCode": statusCode,
  };
}

class UpdatedFields {
  String? firstname;
  String? lastname;
  String? address;
  String? email;
  int? phone;
  String? password;
  List<String>? image;

  UpdatedFields({
    this.firstname,
    this.lastname,
    this.address,
    this.email,
    this.phone,
    this.password,
    this.image,
  });

  factory UpdatedFields.fromJson(Map<String, dynamic> json) => UpdatedFields(
    firstname: json["firstname"],
    lastname: json["lastname"],
    address: json["address"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "address": address,
    "email": email,
    "phone": phone,
    "password": password,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
  };
}
