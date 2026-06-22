import 'package:absensi/presentation/login/models/lupa_password_models.dart';
import 'package:absensi/presentation/login/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthService _authService;
  ForgotPasswordBloc(this._authService) : super(const _Initial()) {
    on<_RequestForgotPassword>((event, emit) async {
      emit(const ForgotPasswordState.loading());

      final result = await _authService.forgotPassword(event.email);

      await result.fold(
        (error) async {
          emit(ForgotPasswordState.failed(error));
        },
        (response) async {
          emit(ForgotPasswordState.loadForgotPassword(response));
        },
      );
    });
    on<_RequestVerifyToken>((event, emit) async {
      emit(const ForgotPasswordState.loading());

      final result = await _authService.verifyResetToken(event.token);

      await result.fold(
        (error) async {
          emit(ForgotPasswordState.failed(error));
        },
        (response) async {
          emit(ForgotPasswordState.loadVerifyToken(response));
        },
      );
    });

    on<_RequestResetPassword>((event, emit) async {
      emit(const ForgotPasswordState.loading());

      final result = await _authService.resetPassword(
          token: event.token, newPassword: event.newPassword);

      await result.fold(
        (error) async {
          emit(ForgotPasswordState.failed(error));
        },
        (response) async {
          emit(ForgotPasswordState.resetPassword(response));
        },
      );
    });

    on<_Started>((event, emit) async {
      emit(const ForgotPasswordState.initial());
    });
  }
}
