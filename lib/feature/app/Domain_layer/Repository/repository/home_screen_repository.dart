import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/AddCartResponseEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/CategoryResponseOrBrandEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/ProductResponseEntity.dart';

import '../../../../Auth/Domain_layer/Entities/failures.dart';

abstract class HomeScreenRepository {
  Future<Either<Failures, CategoryResponseOrBrandEntity>> getAllCategories();

  Future<Either<Failures, CategoryResponseOrBrandEntity>> getBrands();

  Future<Either<Failures, ProductResponseEntity>> getProducts();
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);
}
