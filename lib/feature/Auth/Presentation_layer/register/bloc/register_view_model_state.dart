part of 'register_view_model_cubit.dart';

@immutable
class RegisterViewModelState {
  final String? error;
  final Status registerStatus;
  final AuthResultEntity? authResultEntity;

  const RegisterViewModelState({
    this.error,
    this.registerStatus = Status.initial,
    this.authResultEntity,
  });

  RegisterViewModelState copyWith({
    String? error,
    Status? registerStatus,
    AuthResultEntity? authResultEntity,
  }) {
    return RegisterViewModelState(
      error: error ?? this.error,
      registerStatus: registerStatus ?? this.registerStatus,
      authResultEntity: authResultEntity ?? this.authResultEntity,
    );
  }
}
