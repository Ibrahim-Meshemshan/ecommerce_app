//todo: viewModel => object useCase
//todo: useCase => object repository
//todo: repository => object dataSource
//todo: dataSource => object ApiManager

import 'package:e_commerce/feature/app/Data_layer/Repository/data_source/home_screen_data_source_impl.dart';
import 'package:e_commerce/feature/app/Data_layer/Repository/repository/home_screen_repository_impl.dart';
import 'package:e_commerce/feature/app/Data_layer/api/home_api_manager.dart';
import 'package:e_commerce/feature/app/Domain_layer/Repository/data_source/home_screen_data_source.dart';
import 'package:e_commerce/feature/app/Domain_layer/Repository/repository/home_screen_repository.dart';
import 'package:e_commerce/feature/app/Domain_layer/Use_cases/add_cart_use_case.dart';
import 'package:e_commerce/feature/app/Domain_layer/Use_cases/get_Brand_Use_case.dart';
import 'package:e_commerce/feature/app/Domain_layer/Use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/feature/app/Domain_layer/Use_cases/get_all_product_use_case.dart';

GetAllCategoriesUseCase injectHomeScreenUseCase() {
  return GetAllCategoriesUseCase(
      homeScreenRepository: injectHomeScreenRepository());
}

GetBrandUseCase injectGetBrandUseCase() {
  return GetBrandUseCase(homeScreenRepository: injectHomeScreenRepository());
}

GetAllProductUseCase injectGetAllProductUseCase() {
  return GetAllProductUseCase(
      homeScreenRepository: injectHomeScreenRepository());
}

HomeScreenRepository injectHomeScreenRepository() {
  return HomeScreenRepositoryImpl(
      homeScreenDataSource: injectHomeScreenDataSource());
}
AddCartUseCase injectAddCartUseCase(){
  return AddCartUseCase(homeScreenRepository: injectHomeScreenRepository());
}

HomeScreenDataSource injectHomeScreenDataSource() {
  return HomeScreenDataSourceImpl(apiManager: HomeApiManager.getInstance());
}
