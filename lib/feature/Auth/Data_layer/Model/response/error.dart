// To parse this JSON data, do
//
//     final error = errorFromJson(jsonString);

import 'dart:convert';

ErrorPhone errorFromJson(String str) => ErrorPhone.fromJson(json.decode(str));

String errorToJson(ErrorPhone data) => json.encode(data.toJson());

class ErrorPhone {
  final String? value;
  final String? msg;
  final String? param;
  final String? location;

  ErrorPhone({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  factory ErrorPhone.fromJson(Map<String, dynamic> json) => ErrorPhone(
    value: json["value"],
    msg: json["msg"],
    param: json["param"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "msg": msg,
    "param": param,
    "location": location,
  };
}
