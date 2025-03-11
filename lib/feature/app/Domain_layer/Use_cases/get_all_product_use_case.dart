import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/ProductResponseEntity.dart';

import '../../../Auth/Domain_layer/Entities/failures.dart';
import '../Repository/repository/home_screen_repository.dart';

class GetAllProductUseCase {
  HomeScreenRepository homeScreenRepository;

  GetAllProductUseCase({required this.homeScreenRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeScreenRepository.getProducts();
  }
}
