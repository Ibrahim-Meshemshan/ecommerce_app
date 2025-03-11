import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/Auth/Data_layer/api/api_manager.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/auth_result_entity.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/failures.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String confirmPassword, String phone) async {
    var either = await apiManager.register(
        name, email, password, confirmPassword, phone);
    return either.fold(
      (failure) => Left(failure),
      (response) => Right(response.toAuthResultEntity()),
    );
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold(
      (failure) => Left(failure),
      (response) => Right(response.toAuthResultEntity()),
    );
  }
}
