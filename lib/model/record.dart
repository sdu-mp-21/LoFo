// To parse this JSON data, do
//
//     final records = recordsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Records recordsFromJson(String str) => Records.fromJson(json.decode(str));

String recordsToJson(Records data) => json.encode(data.toJson());

class Records {
  Records({
    required this.records,
  });

  final List<Record> records;

  factory Records.fromJson(Map<String, dynamic> json) => Records(
    records: List<Record>.from(json["Records"].map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Records": List<dynamic>.from(records.map((x) => x.toJson())),
  };
}

class Record {
  Record({
    required this.id,
    required this.title,
    required this.customerNumber,
    required this.customerRole,
    required this.customerName,
    required this.customerImg,
    required this.category,
    required this.image,
    required this.status,
    required this.time,
    required this.place,
    required this.description,
  });

  final int id;
  final String title;
  final String customerNumber;
  final String customerRole;
  final String customerName;
  final String customerImg;
  final String category;
  final String image;
  final String status;
  final String time;
  final String place;
  final String description;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["id"],
    title: json["title"],
    customerNumber: json["customer_number"],
    customerRole: json["customer_role"],
    customerName: json["customer_name"],
    customerImg: json["customer_img"],
    category: json["category"],
    image: json["image"],
    status: json["status"],
    time: json["time"],
    place: json["place"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "customer_number": customerNumber,
    "customer_role": customerRole,
    "customer_name": customerName,
    "customer_img": customerImg,
    "category": category,
    "image": image,
    "status": status,
    "time": time,
    "place": place,
    "description": description,
  };
}
