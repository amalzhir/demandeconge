// To parse this JSON data, do
//
//     final congeModel = congeModelFromJson(jsonString);

import 'dart:convert';

List<CongeModel> congeModelFromJson(String str) => List<CongeModel>.from(json.decode(str).map((x) => CongeModel.fromJson(x)));

String congeModelToJson(List<CongeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CongeModel {
  String title;
  String dateStart;
  String dateEnd;
  String status;

  CongeModel({
    required this.title,
    required this.dateStart,
    required this.dateEnd,
    required this.status,
  });

  factory CongeModel.fromJson(Map<String, dynamic> json) => CongeModel(
    title: json["title"],
    dateStart: json["dateStart"],
    dateEnd: json["dateEnd"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "dateStart": dateStart,
    "dateEnd": dateEnd,
    "status": status,
  };
}
