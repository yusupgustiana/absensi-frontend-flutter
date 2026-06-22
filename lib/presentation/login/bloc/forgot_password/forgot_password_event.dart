part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.started() = _Started;
  const factory ForgotPasswordEvent.requestForgotPassword(String email) =
      _RequestForgotPassword;
  const factory ForgotPasswordEvent.requestVerifyToken(String token) = _RequestVerifyToken;
  const factory ForgotPasswordEvent.requestResetPassword(String token,String newPassword) =
      _RequestResetPassword;
}
