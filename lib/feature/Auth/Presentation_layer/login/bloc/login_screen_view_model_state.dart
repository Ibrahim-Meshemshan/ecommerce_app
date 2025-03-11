part of 'login_screen_view_model_cubit.dart';

@immutable
sealed class LoginScreenViewModelState {}

final class LoginScreenViewModelInitial extends LoginScreenViewModelState {}

final class LoginScreenViewModelLoading extends LoginScreenViewModelState {
  String loadingMessage;
  LoginScreenViewModelLoading({required this.loadingMessage});
}

final class LoginScreenViewModelSuccess extends LoginScreenViewModelState {
  AuthResultEntity authResultEntity;
  LoginScreenViewModelSuccess({required this.authResultEntity});
}

final class LoginScreenViewModelError extends LoginScreenViewModelState {
  String? error;
  LoginScreenViewModelError({required this.error});
}
