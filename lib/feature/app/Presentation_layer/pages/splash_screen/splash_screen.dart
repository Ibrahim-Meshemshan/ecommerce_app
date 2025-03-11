import 'package:e_commerce/feature/Auth/Presentation_layer/login/page/login_screen.dart';
import 'package:e_commerce/feature/Auth/Presentation_layer/register/page/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routName = 'splash_screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, LoginScreen.routName),
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/Splash Screen.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
