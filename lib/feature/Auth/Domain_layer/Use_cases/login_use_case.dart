import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Repository/repository/auth_repository.dart';

import '../Entities/auth_result_entity.dart';
import '../Entities/failures.dart';

class LoginUseCase {

  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});


  Future<Either<Failures, AuthResultEntity>> invoke(String email,String password){
    return authRepository.login(email, password);
  }
}