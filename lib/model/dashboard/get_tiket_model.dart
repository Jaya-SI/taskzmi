// To parse this JSON data, do
//
//     final getTiketModel = getTiketModelFromJson(jsonString);

import 'dart:convert';

GetTiketModel getTiketModelFromJson(String str) =>
    GetTiketModel.fromJson(json.decode(str));

String getTiketModelToJson(GetTiketModel data) => json.encode(data.toJson());

class GetTiketModel {
  GetTiketModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory GetTiketModel.fromJson(Map<String, dynamic> json) => GetTiketModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.idEventcat,
    this.idUser,
    this.title,
    this.image,
    this.banner,
    this.status,
    this.startDate,
    this.endDate,
    this.organizer,
    this.venue,
    this.description,
    this.ticketQty,
    this.slug,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.imgUrl,
    this.bannerUrl,
  });

  int? id;
  String? idEventcat;
  String? idUser;
  String? title;
  String? image;
  String? banner;
  String? status;
  DateTime? startDate;
  DateTime? endDate;
  String? organizer;
  String? venue;
  String? description;
  String? ticketQty;
  String? slug;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imgUrl;
  String? bannerUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idEventcat: json["id_eventcat"],
        idUser: json["id_user"],
        title: json["title"],
        image: json["image"],
        banner: json["banner"],
        status: json["status"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        organizer: json["organizer"],
        venue: json["venue"],
        description: json["description"],
        ticketQty: json["ticket_qty"],
        slug: json["slug"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imgUrl: json["img_url"],
        bannerUrl: json["banner_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_eventcat": idEventcat,
        "id_user": idUser,
        "title": title,
        "image": image,
        "banner": banner,
        "status": status,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "organizer": organizer,
        "venue": venue,
        "description": description,
        "ticket_qty": ticketQty,
        "slug": slug,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "img_url": imgUrl,
        "banner_url": bannerUrl,
      };
}
