// To parse this JSON data, do
//
//     final addTiketModel = addTiketModelFromJson(jsonString);

import 'dart:convert';

AddTiketModel addTiketModelFromJson(String str) =>
    AddTiketModel.fromJson(json.decode(str));

String addTiketModelToJson(AddTiketModel data) => json.encode(data.toJson());

class AddTiketModel {
  AddTiketModel({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  factory AddTiketModel.fromJson(Map<String, dynamic> json) => AddTiketModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
