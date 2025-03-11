import 'package:e_commerce/feature/app/Domain_layer/di/di.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/bloc/home_screen_view_model.dart';

import 'package:flutter/material.dart';

import '../../../../../core/Theme/theme_manager.dart';

class HomePage extends StatelessWidget {
  static const String routName = 'home_page';

  HomePage({super.key});

  HomeScreenViewModel viewModel = HomeScreenViewModel(
      homeScreenUseCase: injectHomeScreenUseCase(),
      getBrandUseCase: injectGetBrandUseCase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.whiteColor,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: viewModel.selectedItem,
        builder: (context, index, child) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,
              currentIndex: index,
              onTap: (value) {
                viewModel.selectedItem.value = value;
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: ThemeManager.primaryColor,
                    icon: const Image(
                        image: AssetImage('assets/icon/Home_icon.png')),
                    label: 'Home'),
                BottomNavigationBarItem(
                    backgroundColor: ThemeManager.primaryColor,
                    icon: const Image(
                        image: AssetImage('assets/icon/Category_icon.png')),
                    label: 'Category'),
                BottomNavigationBarItem(
                    backgroundColor: ThemeManager.primaryColor,
                    icon: const Image(
                        image: AssetImage('assets/icon/Favourites_icon.png')),
                    label: 'Favourites'),
                BottomNavigationBarItem(
                    backgroundColor: ThemeManager.primaryColor,
                    icon: const Image(
                        image: AssetImage('assets/icon/Profile_icon.png')),
                    label: 'Profile'),
              ],
            ),
          );
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: viewModel.selectedItem,
        builder: (context, index, child) {
          return viewModel.pages[index];
        },
      ),
    );
  }
}
