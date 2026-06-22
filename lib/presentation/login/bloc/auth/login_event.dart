part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.loginRequest(
      {required String username,
      required String password,
      required bool rememberMe}) = _LoginPressed;
  const factory LoginEvent.loginSuccess({
    UserModel? user,
  }) = _LoginSuccess;
}
