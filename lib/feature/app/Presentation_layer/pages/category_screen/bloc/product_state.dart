import 'package:e_commerce/feature/Auth/Domain_layer/Entities/failures.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/AddCartResponseEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/ProductResponseEntity.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {
  String? loadingMessage;

  ProductLoadingState({required this.loadingMessage});
}

class ProductErrorState extends ProductState {
  Failures? error;

  ProductErrorState({required this.error});
}

class ProductSuccessState extends ProductState {
  ProductResponseEntity productResponseEntity;
  ProductSuccessState({required this.productResponseEntity});
}

class AddToCartInitialState extends ProductState {}

class AddToCartLoadingState extends ProductState {
  String? loadingMessage;

  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends ProductState {
  Failures? error;

  AddToCartErrorState({required this.error});
}

class AddToCartSuccessState extends ProductState {
  AddCartResponseEntity addCartResponseEntity;
  AddToCartSuccessState({required this.addCartResponseEntity});
}