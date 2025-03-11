import 'package:e_commerce/core/Theme/theme_manager.dart';
import 'package:e_commerce/feature/app/Domain_layer/di/di.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/category_screen/bloc/product_state.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/category_screen/bloc/product_view_model.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/category_screen/widgets/product_item.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/widgets/custom_appBar.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/widgets/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  ProductViewModel viewModel = ProductViewModel(
      getAllProductUseCase: injectGetAllProductUseCase(),
      addCartUseCase: injectAddCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductViewModel>(
      create: (context) => viewModel..getAllProducts(),
      child: BlocBuilder<ProductViewModel, ProductState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ThemeManager.whiteColor,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const CustomAppbar()),
            body: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  const CustomSearch(),
                  10.verticalSpace,
                  state is ProductLoadingState
                      ? Center(
                    child: CircularProgressIndicator(
                      color: ThemeManager.primaryColor,
                    ),
                  )
                      : ProductItem(productEntity: viewModel.productList)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
