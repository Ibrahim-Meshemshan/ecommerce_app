import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/failures.dart';
import 'package:e_commerce/feature/app/Data_layer/api/home_api_manager.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/AddCartResponseEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/CategoryResponseOrBrandEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/ProductResponseEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Repository/data_source/home_screen_data_source.dart';

class HomeScreenDataSourceImpl implements HomeScreenDataSource {
  HomeApiManager apiManager;

  HomeScreenDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryResponseOrBrandEntity>>
      getAllCategories() async {
    var either = await apiManager.getAllCategories();
    return either.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, CategoryResponseOrBrandEntity>> getBrands() async {
    var either = await apiManager.getBrands();
    return either.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await apiManager.getProducts();
    return either.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId) async{
    var either = await apiManager.addToCart(productId);
    return either.fold(
          (failure) => Left(failure),
          (response) => Right(response),
    );
  }
}
