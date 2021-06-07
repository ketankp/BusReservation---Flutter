// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    required this.id,
    required this.name,
    required this.district,
    required this.state,
    required this.country,
  });

  int id;
  String name;
  String district;
  String state;
  String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        district: json["district"],
        state: json["state"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "district": district,
        "state": state,
        "country": country,
      };
}
