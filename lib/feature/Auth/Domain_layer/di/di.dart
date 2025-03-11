//todo: viewModel => object useCase
//todo: useCase => object repository
//todo: repository => object dataSource
//todo: dataSource => object ApiManager


import 'package:e_commerce/feature/Auth/Data_layer/Repository/data_source/auth_remote_data_source_imp.dart';
import 'package:e_commerce/feature/Auth/Data_layer/Repository/repository/auth_repository_impl.dart';
import 'package:e_commerce/feature/Auth/Data_layer/api/api_manager.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Repository/repository/auth_repository.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Use_cases/login_use_case.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Use_cases/register_use_case.dart';


LoginUseCase injectLoginUseCase(){
  return LoginUseCase(authRepository: injectAuthRepository());
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authRepository: injectAuthRepository());
}
AuthRepository injectAuthRepository(){
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

