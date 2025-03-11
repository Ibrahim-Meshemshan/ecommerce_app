import 'package:dartz/dartz.dart';

import '../../../../Auth/Domain_layer/Entities/failures.dart';
import '../../Entities/AddCartResponseEntity.dart';
import '../../Entities/CategoryResponseOrBrandEntity.dart';
import '../../Entities/ProductResponseEntity.dart';

abstract class HomeScreenDataSource {
  Future<Either<Failures, CategoryResponseOrBrandEntity>> getAllCategories();

  Future<Either<Failures, CategoryResponseOrBrandEntity>> getBrands();

  Future<Either<Failures, ProductResponseEntity>> getProducts();

  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);
}
