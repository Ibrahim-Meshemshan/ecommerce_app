import 'package:dartz/dartz.dart';

import '../../../Auth/Domain_layer/Entities/failures.dart';
import '../Entities/CategoryResponseOrBrandEntity.dart';
import '../Repository/repository/home_screen_repository.dart';

class GetAllCategoriesUseCase {
  HomeScreenRepository homeScreenRepository;

  GetAllCategoriesUseCase({required this.homeScreenRepository});

  Future<Either<Failures, CategoryResponseOrBrandEntity>> invoke() {
    return homeScreenRepository.getAllCategories();
  }
}
