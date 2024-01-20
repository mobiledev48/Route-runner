// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  final bool? status;
  final String? message;
  final Data? data;

  SignInModel({
    this.status,
    this.message,
    this.data,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final bool? multiple;
  final Customer? customer;

  Data({
    this.multiple,
    this.customer,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    multiple: json["multiple"],
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "multiple": multiple,
    "customer": customer?.toJson(),
  };
}

class Customer {
  final String? customerId;
  final String? customerPhoneNo;
  final bool? active;
  final String? avatar;
  final String? customerDialCode;
  final String? customerEmail;
  final String? customerName;
  final String? gymId;
  final String? role;
  final String? trainerId;
  final String? customerOccupation;
  final dynamic customerQualification;
  final String? customerMedicalCondition;
  final dynamic customerAge;
  final DateTime? planExpireDate;
  final bool? profileStatus;
  final String? customerFoodPreference;
  final String? customerTime;
  final String? token;

  Customer({
    this.customerId,
    this.customerPhoneNo,
    this.active,
    this.avatar,
    this.customerDialCode,
    this.customerEmail,
    this.customerName,
    this.gymId,
    this.role,
    this.trainerId,
    this.customerOccupation,
    this.customerQualification,
    this.customerMedicalCondition,
    this.customerAge,
    this.planExpireDate,
    this.profileStatus,
    this.customerFoodPreference,
    this.customerTime,
    this.token,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    customerPhoneNo: json["customer_phone_no"],
    active: json["active"],
    avatar: json["avatar"],
    customerDialCode: json["customer_dialCode"],
    customerEmail: json["customer_email"],
    customerName: json["customer_name"],
    gymId: json["gym_id"],
    role: json["role"],
    trainerId: json["trainer_id"],
    customerOccupation: json["customer_occupation"],
    customerQualification: json["customer_qualification"],
    customerMedicalCondition: json["customer_medical_condition"],
    customerAge: json["customer_age"],
    planExpireDate: json["plan_expire_date"] == null ? null : DateTime.parse(json["plan_expire_date"]),
    profileStatus: json["profile_status"],
    customerFoodPreference: json["customer_food_preference"],
    customerTime: json["customer_time"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "customer_phone_no": customerPhoneNo,
    "active": active,
    "avatar": avatar,
    "customer_dialCode": customerDialCode,
    "customer_email": customerEmail,
    "customer_name": customerName,
    "gym_id": gymId,
    "role": role,
    "trainer_id": trainerId,
    "customer_occupation": customerOccupation,
    "customer_qualification": customerQualification,
    "customer_medical_condition": customerMedicalCondition,
    "customer_age": customerAge,
    "plan_expire_date": planExpireDate?.toIso8601String(),
    "profile_status": profileStatus,
    "customer_food_preference": customerFoodPreference,
    "customer_time": customerTime,
    "token": token,
  };
}
