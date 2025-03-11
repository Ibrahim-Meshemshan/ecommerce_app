import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Entities/auth_result_entity.dart';
import 'package:e_commerce/feature/Auth/Domain_layer/Use_cases/register_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../core/status/status.dart';

part 'register_view_model_state.dart';

class RegisterViewModel extends Cubit<RegisterViewModelState> {
  RegisterViewModel({required this.registerUseCase})
      : super(const RegisterViewModelState());
  RegisterUseCase registerUseCase;

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  void register() async {
    emit(state.copyWith(registerStatus: Status.loading));
    var either = await registerUseCase.invoke(
      userNameController.text,
      emailController.text,
      passwordController.text,
      confirmPasswordController.text,
      phoneController.text,
    );
    return either.fold(
      //registerStatus: Status.error,
      (left) => emit(state.copyWith(
        error: left.errorMessage,
      )),
      (response) => emit(
        state.copyWith(
            registerStatus: Status.success, authResultEntity: response),
      ),
    );
  }
}
