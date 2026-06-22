part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _Loading;
  const factory ForgotPasswordState.loadForgotPassword(ApiResponse email) =
      _LoadForgotPassword;
  const factory ForgotPasswordState.loadVerifyToken(ApiResponse token) =
      _LoadVerifyToken;
  const factory ForgotPasswordState.resetPassword(ApiResponse token) =
      _LoadResetPassword;
  const factory ForgotPasswordState.failed(String message) = _Failed;
}
