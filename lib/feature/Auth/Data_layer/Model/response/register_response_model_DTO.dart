// To parse this JSON data, do
//
//     final registerResponseModelDto = registerResponseModelDtoFromJson(jsonString);

import 'dart:convert';

import 'package:e_commerce/feature/Auth/Data_layer/Model/response/error.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/auth_result_entity.dart';

import '../../../Domain_layer/Entities/register_response_entity.dart';

RegisterResponseModelDto registerResponseModelDtoFromJson(String str) =>
    RegisterResponseModelDto.fromJson(json.decode(str));

String registerResponseModelDtoToJson(RegisterResponseModelDto data) =>
    json.encode(data.toJson());

class RegisterResponseModelDto {
  final String? message;
  final UserDto? user;
  final String? token;
  final String? statusMsg;
  final ErrorPhone? error;

  RegisterResponseModelDto({
    this.statusMsg,
    this.error,
    this.message,
    this.user,
    this.token,
  });

  factory RegisterResponseModelDto.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModelDto(
        message: json["message"],
        statusMsg: json["statusMsg"],
        user: json["user"] == null ? null : UserDto.fromJson(json["user"]),
        error:
            json["errors"] == null ? null : ErrorPhone.fromJson(json["errors"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "errors": error?.toJson(),
        "token": token,
      };

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(user?.toUserEntity(), token);
  }
}

class UserDto {
  final String? name;
  final String? email;
  final String? role;

  UserDto({
    this.name,
    this.email,
    this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        name: json["name"],
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "role": role,
      };

  UserEntity toUserEntity() {
    return UserEntity(
      name: name,
      email: email,
    );
  }
}
