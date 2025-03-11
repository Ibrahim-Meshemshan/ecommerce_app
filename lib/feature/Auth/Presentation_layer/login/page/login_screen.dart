import 'package:e_commerce/core/utils/sharedpreferences.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/di/di.dart';
import 'package:e_commerce/feature/Auth/Presentation_layer/login/bloc/login_screen_view_model_cubit.dart';
import 'package:e_commerce/feature/Auth/Presentation_layer/register/page/register_screen.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/home_screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/Theme/theme_manager.dart';
import '../../../../../core/utils/dialog_utils.dart';
import '../../register/widget/custom_text_form_field.dart';
import '../../register/widget/logo_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = 'login_screen';

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModelCubit viewModel =
      LoginScreenViewModelCubit(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModelCubit, LoginScreenViewModelState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginScreenViewModelLoading) {
          DialogUtils.showLoading(context, 'Loading  . . .');
        } else if (state is LoginScreenViewModelError) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.error!, title: 'Error ');
        } else if (state is LoginScreenViewModelSuccess) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, state.authResultEntity!.userEntity?.name ?? '',
              title: 'Success ',
          );
          //save token
          Shared.saveData(key: 'Token', value: state.authResultEntity.token);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  HomePage()),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LogoWidget(),
                  50.verticalSpace,
                  Text(
                    'Welcom Back To Route',
                    style: ThemeManager.appTheme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  5.verticalSpace,
                  Text(
                    'Please sign in with your mail',
                    style: ThemeManager.appTheme.textTheme.titleSmall
                        ?.copyWith(color: ThemeManager.whiteColor, fontSize: 16),
                  ),
                  10.verticalSpace,
                  CustomFormField(
                    fieldName: 'E_mail address',
                    hintText: 'enter your email address',
                    keyboardType: TextInputType.emailAddress,
                    isObscure: false,
                    controller: viewModel.emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'enter valid email address';
                      }
                      if (!checkValidEmail(value)) {
                        return 'invalid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomFormField(
                    fieldName: 'Password',
                    hintText: 'enter your password',
                    keyboardType: TextInputType.name,
                    isObscure: viewModel.isObscurePassword,
                    controller: viewModel.passwordController,
                    icon: IconButton(
                      onPressed: () {
                        if (viewModel.isObscurePassword) {
                          viewModel.isObscurePassword = false;
                        } else {
                          viewModel.isObscurePassword = true;
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        viewModel.isObscurePassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'enter valid password';
                      }
                      return null;
                    },
                  ),
                  35.verticalSpace,
                  Text(
                    textAlign: TextAlign.end,
                    'Forget Password',
                    style: ThemeManager.appTheme.textTheme.titleMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  50.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.sp)),
                                backgroundColor: ThemeManager.whiteColor,
                                padding: EdgeInsets.all(18.sp)),
                            onPressed: () {
                              if (viewModel.formKey.currentState!.validate()) {
                                viewModel.login();
                                Navigator.pushReplacementNamed(context, HomePage.routName);
                              }
                            },
                            child: Text(
                              'Login',
                              style: ThemeManager.appTheme.textTheme.titleMedium!
                                  .copyWith(
                                      color: ThemeManager.primaryColor,
                                      fontWeight: FontWeight.w900),
                            )),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routName);
                      },
                      child: Text(
                        'Don’t have an account? Create Account',
                        style: ThemeManager.appTheme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool checkValidEmail(String? email) {
    if (email == null) return false;
    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }
}
