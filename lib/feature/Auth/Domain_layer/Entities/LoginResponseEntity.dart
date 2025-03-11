import 'package:e_commerce/feature/Auth/Domain_layer/Entities/register_response_entity.dart';

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user, 
      this.token,});


  String? message;
  UserEntity? user;
  String? token;


}

