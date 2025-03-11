import 'package:e_commerce/core/Theme/theme_manager.dart';
import 'package:e_commerce/feature/app/Domain_layer/di/di.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/bloc/home_screen_view_model.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/widgets/category_or_brand_item.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/widgets/custom_appBar.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/widgets/custom_search.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/widgets/row_widget.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/home_state.dart';

class HomeScreen extends StatefulWidget {


  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel(
      homeScreenUseCase: injectHomeScreenUseCase(),
      getBrandUseCase: injectGetBrandUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeState>(
      bloc: viewModel
        ..getAllCategory()
        ..getAllBrand(),
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ThemeManager.whiteColor,
            body: Padding(
              padding: EdgeInsets.all(10.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppbar(),
                    const CustomSearch(),
                    15.verticalSpace,
                    const SliderWidget(),
                    10.verticalSpace,
                    RowWidget(
                      text: 'Category',
                    ),
                    5.verticalSpace,
                    state is HomeLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: ThemeManager.primaryColor,
                            ),
                          )
                        : CategoryOrBrandItem(entity: viewModel.categoryList),
                    10.verticalSpace,
                    RowWidget(
                      text: 'Brand',
                    ),
                    10.verticalSpace,
                    state is HomeLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: ThemeManager.primaryColor,
                            ),
                          )
                        : CategoryOrBrandItem(entity: viewModel.brandsList),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
