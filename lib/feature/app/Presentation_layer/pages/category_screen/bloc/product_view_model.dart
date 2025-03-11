import 'package:e_commerce/feature/app/Domain_layer/Use_cases/add_cart_use_case.dart';
import 'package:e_commerce/feature/app/Domain_layer/Use_cases/get_all_product_use_case.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/category_screen/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Domain_layer/Entities/ProductResponseEntity.dart';

class ProductViewModel extends Cubit<ProductState> {
  ProductViewModel(
      {required this.getAllProductUseCase, required this.addCartUseCase})
      : super(ProductInitialState());
  GetAllProductUseCase getAllProductUseCase;
  AddCartUseCase addCartUseCase;
  List<ProductEntity> productList = [];
  int numOfCartItem = 0;
  //todo: to use object in many widget
  static ProductViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductLoadingState(loadingMessage: 'Loading ...'));
    var either = await getAllProductUseCase.invoke();
    either.fold(
      (failure) => emit(ProductErrorState(error: failure)),
      (response) {
        productList = response.data ?? [];
        emit(ProductSuccessState(productResponseEntity: response));
      },
    );
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(loadingMessage: 'Loading ...'));
    var either = await addCartUseCase.invoke(productId);
    either.fold(
      (failure) => emit(AddToCartErrorState(error: failure)),
      (response) {
        // productList = response.data ?? [];
        numOfCartItem = response.numOfCartItems!.toInt();
        print('numOfCartItem: $numOfCartItem');
        emit(AddToCartSuccessState(addCartResponseEntity: response));
      },
    );
  }
}
