import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Repository/repository/auth_repository.dart';

import '../Entities/auth_result_entity.dart';
import '../Entities/failures.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> invoke(String name, String email,
      String password, String confirmPassword, String phone) {

    return authRepository.register(
        name, email, password, confirmPassword, phone);
  }
}
