import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/app/Domain_layer/Repository/repository/home_screen_repository.dart';

import '../../../Auth/Domain_layer/Entities/failures.dart';
import '../Entities/CategoryResponseOrBrandEntity.dart';

class GetBrandUseCase {
  HomeScreenRepository homeScreenRepository;
  GetBrandUseCase({required this.homeScreenRepository});

  Future<Either<Failures, CategoryResponseOrBrandEntity>> invoke(){
    return homeScreenRepository.getBrands();
  }
}