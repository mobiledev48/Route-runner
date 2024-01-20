// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  bool? success;
  String? message;
  String? id;
  String? firstname;
  String? lastname;
  int? phone;
  String? email;
  String? token;
  int? statusCode;

  SignInModel({
     this.success,
     this.message,
     this.id,
     this.firstname,
     this.lastname,
     this.phone,
     this.email,
     this.token,
     this.statusCode,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    success: json["success"],
    message: json["message"],
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone: json["phone"],
    email: json["email"],
    token: json["token"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "_id": id,
    "firstname": firstname,
    "lastname": lastname,
    "phone": phone,
    "email": email,
    "token": token,
    "statusCode": statusCode,
  };
}
