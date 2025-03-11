import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/Auth/Data_layer/Model/request/LoginRequest.dart';
import 'package:e_commerce/feature/Auth/Data_layer/Model/request/register_request.dart';
import 'package:e_commerce/feature/Auth/Data_layer/Model/response/LoginResponseDto.dart';
import 'package:e_commerce/feature/Auth/Data_layer/Model/response/register_response_model_DTO.dart';
import 'package:e_commerce/feature/Auth/Data_layer/api/api_const.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/failures.dart';
import 'package:http/http.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponseModelDto>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var registerRequest = RegisterRequest(
          email: email,
          name: name,
          password: password,
          rePassword: confirmPassword,
          phone: phone);
      final response = await post(
        body: registerRequest.toJson(),
        Uri(
          scheme: ApiConst.scheme,
          host: ApiConst.host,
          path: ApiConst.endPointRegister,
        ),
      );

      var registerResponse = registerResponseModelDtoFromJson(response.body);

      if (response.statusCode >= 201 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg!
                : registerResponse.message));
      }
    } else {
      print('Connectivity Result: $connectivityResult');
      //no internet connection
      return Left(NetworkError(
          errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, LoginResponseDto>> login(
    String email,
    String password,
  ) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var loginRequest = LoginRequest(email: email, password: password);
      final response = await post(
        body: loginRequest.toJson(),
        Uri(
            scheme: ApiConst.scheme,
            host: ApiConst.host,
            path: ApiConst.endPointLogin),
      );
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message));
      }
    } else {
      print('Connectivity Result: $connectivityResult');
      //no internet connection
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }
}

