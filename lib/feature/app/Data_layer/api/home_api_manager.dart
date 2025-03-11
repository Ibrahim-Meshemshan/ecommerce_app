import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/app/Data_layer/Model/AddCartResponseDto.dart';
import 'package:e_commerce/feature/app/Data_layer/Model/CategoryOrBrandResponseDto.dart';
import 'package:e_commerce/feature/app/Data_layer/Model/ProductResponseDto.dart';
import 'package:http/http.dart';

import '../../../../core/utils/sharedpreferences.dart';
import '../../../Auth/Domain_layer/Entities/failures.dart';

class HomeApiManager {
  HomeApiManager._();

  static HomeApiManager? _instance;

  static HomeApiManager getInstance() {
    _instance ??= HomeApiManager._();
    return _instance!;
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>>
  getAllCategories() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final response = await get(
        Uri(
          //https://ecommerce.routemisr.com/api/v1/categories
          scheme: 'https',
          host: 'ecommerce.routemisr.com',
          path: '/api/v1/categories',
        ),
      );
      var categoryResponse = CategoryOrBrandResponseDto.fromJson(
          jsonDecode(response.body));

      if (response.statusCode == 200) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(errorMessage: categoryResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrands() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final response = await get(
        Uri(
          //https://ecommerce.routemisr.com/api/v1/brands
          scheme: 'https',
          host: 'ecommerce.routemisr.com',
          path: '/api/v1/brands',
        ),
      );
      var brandResponse = CategoryOrBrandResponseDto.fromJson(
          jsonDecode(response.body));

      if (response.statusCode == 200) {
        return Right(brandResponse);
      } else {
        return Left(ServerError(errorMessage: brandResponse.message));
      }
    } else {
      //no internet Connection
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getProducts() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final response = await get(
        Uri(
          //https://ecommerce.routemisr.com/api/v1/products
          scheme: 'https',
          host: 'ecommerce.routemisr.com',
          path: '/api/v1/products',
        ),
      );
      var productResponse = ProductResponseDto.fromJson(
          jsonDecode(response.body));

      if (response.statusCode == 200) {
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: productResponse.message));
      }
    } else {
      //no internet Connection
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

    Future<Either<Failures, AddCartResponseDto>> addToCart(
        String productId) async {
      final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var token = Shared.getDat(key: 'Token');
        final response = await post(
          body: {
            'productId': productId
          },
          headers: {
            'token' : token!.toString()
          },
          Uri(
            //https://ecommerce.routemisr.com/api/v1/cart
            scheme: 'https',
            host: 'ecommerce.routemisr.com',
            path: '/api/v1/cart',
          ),
        );
        var addCartResponse = AddCartResponseDto.fromJson(
            jsonDecode(response.body));

        if (response.statusCode >=200 && response.statusCode < 300) {
          return Right(addCartResponse);
        }else if(response.statusCode ==401){
          return Left(ServerError(errorMessage: addCartResponse.message));
        } else {
          return Left(ServerError(errorMessage: addCartResponse.message));
        }
      } else {
        //no internet Connection
        return Left(
            NetworkError(errorMessage: 'please check internet connection'));
      }
    }
}
