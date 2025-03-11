import 'package:e_commerce/core/Theme/theme_manager.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/feature/Auth/Presentation_layer/register/bloc/register_view_model_cubit.dart';
import 'package:e_commerce/feature/Auth/Presentation_layer/register/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/status/status.dart';
import '../../../Domain_layer/di/di.dart';
import '../widget/logo_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const String routName = 'register_screen';

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel =
      RegisterViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterViewModelState>(
      bloc: viewModel,
      listener: (context, state) {

        if (state.registerStatus == Status.loading) {
          DialogUtils.showLoading(context, 'Loading  . . .');

        } else if (state.registerStatus == Status.error) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.error!, title: 'Error ');
        } else if (state.registerStatus == Status.success) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, state.authResultEntity!.userEntity?.name ?? '',
              title: 'Success ');
          DialogUtils.hideLoading(context);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LogoWidget(),
                  10.verticalSpace,
                  CustomFormField(
                    fieldName: 'Full Name',
                    hintText: 'enter your full name',
                    keyboardType: TextInputType.name,
                    isObscure: false,
                    controller: viewModel.userNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'enter valid name';
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    fieldName: 'Mobile Number',
                    hintText: 'enter your mobile number',
                    keyboardType: TextInputType.number,
                    isObscure: false,
                    controller: viewModel.phoneController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'enter valid Mobile Number';
                      }
                      return null;
                    },
                  ),
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
                  CustomFormField(
                    fieldName: 'ConfirmPassword',
                    hintText: 'reWrite Password',
                    keyboardType: TextInputType.name,
                    isObscure: viewModel.isObscureConfirmPassword,
                    icon: IconButton(
                      onPressed: () {
                        if (viewModel.isObscureConfirmPassword) {
                          viewModel.isObscureConfirmPassword = false;
                        } else {
                          viewModel.isObscureConfirmPassword = true;
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        viewModel.isObscureConfirmPassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                      ),
                    ),
                    controller: viewModel.confirmPasswordController,
                    validator: (value) {
                      if (!(viewModel.confirmPasswordController.text ==
                          viewModel.passwordController.text)) {
                        return "password don't match";
                      }
                      return null;
                    },
                  ),
                  35.verticalSpace,
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
                                viewModel.register();
                                print('Form validation failed');
                                // Navigator.pushReplacementNamed(context, HomeScreen.routName);
                              }
                            },
                            child: Text(
                              'Sing up',
                              style: ThemeManager
                                  .appTheme.textTheme.titleMedium!
                                  .copyWith(
                                      color: ThemeManager.primaryColor,
                                      fontWeight: FontWeight.w900),
                            )),
                      ),
                    ],
                  ),
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
