import 'package:e_commerce/feature/Auth/Domain_layer/Entities/failures.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/CategoryResponseOrBrandEntity.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  Failures? error;

  HomeErrorState({required this.error});
}

class HomeSuccessState extends HomeState {
  CategoryResponseOrBrandEntity categoryResponseModelEntity;
  HomeSuccessState({required this.categoryResponseModelEntity});
}
