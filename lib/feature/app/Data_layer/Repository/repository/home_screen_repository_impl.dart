import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/failures.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/AddCartResponseEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/CategoryResponseOrBrandEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/ProductResponseEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Repository/data_source/home_screen_data_source.dart';
import 'package:e_commerce/feature/app/Domain_layer/Repository/repository/home_screen_repository.dart';

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  HomeScreenDataSource homeScreenDataSource;

  HomeScreenRepositoryImpl({required this.homeScreenDataSource});

  @override
  Future<Either<Failures, CategoryResponseOrBrandEntity>> getAllCategories() {
    return homeScreenDataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoryResponseOrBrandEntity>> getBrands() {
    return homeScreenDataSource.getBrands();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return homeScreenDataSource.getProducts();
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId) {
    return homeScreenDataSource.addToCart(productId);
  }
}
