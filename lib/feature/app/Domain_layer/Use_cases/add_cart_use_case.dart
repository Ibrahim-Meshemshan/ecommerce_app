import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/AddCartResponseEntity.dart';

import '../../../Auth/Domain_layer/Entities/failures.dart';

import '../Repository/repository/home_screen_repository.dart';

class AddCartUseCase {
  HomeScreenRepository homeScreenRepository;

  AddCartUseCase({required this.homeScreenRepository});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId) {
    return homeScreenRepository.addToCart(productId);
  }
}
