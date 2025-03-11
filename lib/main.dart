import 'package:e_commerce/core/Theme/theme_manager.dart';
import 'package:e_commerce/core/utils/sharedpreferences.dart';
import 'package:e_commerce/feature/Auth/Presentation_layer/login/page/login_screen.dart';
import 'package:e_commerce/feature/Auth/Presentation_layer/register/page/register_screen.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/category_screen/page/product_details.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/page/home_screen.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/app/Presentation_layer/pages/home_screen/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  var user = Shared.getDat(key: 'Token');
  await ScreenUtil.ensureScreenSize();
  String route ;
  if(user == null){
    route = LoginScreen.routName;
  }else{
    route = HomePage.routName;
  }
  runApp( MyApp(route: route,));
}

class MyApp extends StatelessWidget {
  String route;
   MyApp({required this.route});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: const Size(360, 690));
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeManager.appTheme,
              home: const SplashScreen(),
              initialRoute: HomePage.routName,
              routes: {
                SplashScreen.routName: (context) => const SplashScreen(),
                LoginScreen.routName: (context) =>  LoginScreen(),
                RegisterScreen.routName: (context) =>  RegisterScreen(),
                HomePage.routName: (context) =>   HomePage(),
                ProductDetails.routName: (context) =>   ProductDetails(),

              }
          );
        }

    );
  }
}

