import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/auth_result_entity.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/failures.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Use_cases/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_screen_view_model_state.dart';

class LoginScreenViewModelCubit extends Cubit<LoginScreenViewModelState> {
  LoginScreenViewModelCubit({required this.loginUseCase})
      : super(LoginScreenViewModelInitial());

  LoginUseCase loginUseCase;
  bool isObscurePassword = true;

  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController =
      TextEditingController();

  void login() async {
    emit(LoginScreenViewModelLoading(loadingMessage: 'Loading ...'));

    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold(
      (left) => emit(LoginScreenViewModelError(error: left.errorMessage)),
      (response) => emit(LoginScreenViewModelSuccess(
        authResultEntity: response,
      )),
    );
  }
}
