import 'package:e_commerce/feature/app/Domain_layer/Entities/CategoryResponseOrBrandEntity.dart';
import 'package:e_commerce/feature/app/Domain_layer/Use_cases/get_Brand_Use_case.dart';
import 'package:e_commerce/feature/app/Domain_layer/Use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../category_screen/page/product_screen.dart';
import '../../favorits_screen/page/favorits_screen.dart';
import '../../profile_screen/page/portfolio_screen.dart';
import '../page/home_screen.dart';

class HomeScreenViewModel extends Cubit<HomeState> {
  HomeScreenViewModel({required this.homeScreenUseCase,required this.getBrandUseCase})
      : super(HomeInitialState());

  GetAllCategoriesUseCase homeScreenUseCase;
  GetBrandUseCase getBrandUseCase;

  //todo: hold data & handle logic

  final ValueNotifier<int> selectedItem = ValueNotifier<int>(1);
  List<Widget> pages = [
    HomeScreen(),
    ProductsScreen(),
    FavouritesScreen(),
    PortfolioScreen(),
  ];

  List<CategoryOrBrandEntity> categoryList = const [];
  List<CategoryOrBrandEntity> brandsList = const [];

  void getAllCategory() async {
    emit(HomeLoadingState());
    var either = await homeScreenUseCase.invoke();
    either.fold((failure) => emit(HomeErrorState(error: failure)), (response) {
      categoryList = response.data ?? [];
      emit(HomeSuccessState(categoryResponseModelEntity: response));
    });
  }

  void getAllBrand() async {
    emit(HomeLoadingState());
    var either = await getBrandUseCase.invoke();
    either.fold((failure) => emit(HomeErrorState(error: failure)),
            (response) {
      brandsList = response.data ?? [];
      emit(HomeSuccessState(categoryResponseModelEntity: response));
    });
  }
}
