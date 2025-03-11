import 'package:e_commerce/feature/Auth/Domain_layer/Entities/register_response_entity.dart';

class AuthResultEntity {
  UserEntity? userEntity;
  String? token;

  AuthResultEntity(this.userEntity,this.token);

  //todo: we can use class AuthResultEntity or class RegisterResponseEntity (same thing)
}