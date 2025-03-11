// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  final String? name;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    rePassword: json["rePassword"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "rePassword": rePassword,
    "phone": phone,
  };
}
