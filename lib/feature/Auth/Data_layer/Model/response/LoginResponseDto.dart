import 'package:e_commerce/feature/Auth/Data_layer/Model/response/register_response_model_DTO.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/auth_result_entity.dart';

import '../../../Domain_layer/Entities/register_response_entity.dart';

class LoginResponseDto {
  LoginResponseDto({
    this.message,
    this.user,
    this.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    statusMsg = json["statusMsg"];
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? statusMsg;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(user?.toUserEntity(), token);


  }
}
