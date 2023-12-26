// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  List<Location>? locations;

  LocationModel({
    this.locations,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    locations: json["locations"] == null ? [] : List<Location>.from(json["locations"]!.map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x.toJson())),
  };
}

class Location {
  String? id;
  String? locationname;
  String? address;
  String? percentage;

  Location({
    this.id,
    this.locationname,
    this.address,
    this.percentage,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["_id"],
    locationname: json["locationname"],
    address: json["address"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "locationname": locationname,
    "address": address,
    "percentage": percentage,
  };
}
