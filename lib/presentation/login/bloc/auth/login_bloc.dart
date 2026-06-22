import 'package:absensi/presentation/login/models/response_login.dart';
import 'package:absensi/presentation/login/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  LoginBloc(this._authService) : super(const LoginState.initial()) {
    on<_LoginPressed>((event, emit) async {
      emit(const LoginState.loading());

      final result = await _authService.login(event.username, event.password);

      await result.fold(
        (error) async {
          emit(LoginState.failed(error));
        },
        (user) async {
          // ✅ Debug log
          if (kDebugMode) print('Remember Me: ${event.rememberMe}');
          if (kDebugMode) print('Simpan username: ${event.username}');

          if (event.rememberMe) {
            await storage.write(key: 'username', value: event.username);
            await storage.write(key: 'password', value: event.password);
            await storage.write(key: 'remember_me', value: 'true');
          } else {
            await storage.delete(key: 'username');
            await storage.delete(key: 'password');
            await storage.write(key: 'remember_me', value: 'false');
          }

          await storage.write(
              key: 'id_user', value: user.user.idUser.toString());

          emit(LoginState.success(user));
        },
      );
    });
  }
}
