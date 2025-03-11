import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/auth_result_entity.dart';

import '../../Entities/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String confirmPassword, String phone);

  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password);
}
