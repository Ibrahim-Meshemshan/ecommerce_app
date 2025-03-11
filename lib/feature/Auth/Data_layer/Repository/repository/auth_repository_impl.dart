import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/auth_result_entity.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/failures.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Repository/repository/auth_repository.dart';

import '../../../Domain_layer/Repository/data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String confirmPassword, String phone) async {
    return authRemoteDataSource.register(
        name, email, password, confirmPassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(String email, String password) {
    return authRemoteDataSource.login(email, password);
  }
}
