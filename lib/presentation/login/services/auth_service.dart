import 'dart:async';
import 'dart:convert';

import 'package:absensi/helper/variables.dart';
import 'dart:io';
import 'package:absensi/presentation/login/models/response_login.dart';
import 'package:absensi/presentation/login/models/lupa_password_models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final http.Client _client;
  static const _storage = FlutterSecureStorage();

  AuthService({http.Client? client}) : _client = client ?? http.Client();

  Future<Either<String, UserModel>> login(
      String username, String password) async {
    final url = Uri.parse('$baseUrlLogin/login');

    try {
      final response = await _client.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'username': username,
          'password': password,
        },
      ).timeout(const Duration(seconds: 15)); // ⏱ Timeout protection

      final jsonMap = json.decode(response.body);

      if (response.statusCode == 200 && jsonMap['status'] == true) {
        final loginResponse = UserModel.fromMap(jsonMap);
        debugPrint('Actions from API: ${loginResponse.actions}');
        await _storeCredentialToLocal(loginResponse);
        return Right(loginResponse);
      } else {
        final errorMessage = jsonMap['message'] ?? 'Login gagal';
        return Left(errorMessage);
      }
    } on SocketException {
      return const Left(
          'Tidak dapat terhubung ke server. Periksa koneksi internet.');
    } on TimeoutException {
      return const Left(
          'Permintaan ke server terlalu lama. Silakan coba lagi.');
    } catch (e) {
      if (kDebugMode) print('Exception: $e');
      return const Left(
          'Terjadi kesalahan internal. Silakan coba beberapa saat lagi.');
    }
  }

  Future<void> _storeCredentialToLocal(UserModel data) async {
    await _storage.write(key: 'id_user', value: data.user.idUser);

    const needed = {
      'akses_kasbon',
      'approved_absen',
    };

    final filtered = <String, bool>{};
    for (final k in needed) {
      filtered[k] = data.actions[k] ?? false;
    }

    await _storage.write(key: 'actions', value: jsonEncode(filtered));
  }

  Future<Either<String, String>> changePassword({
    required String idUser,
    required String currentPassword,
    required String newPassword1,
    required String newPassword2,
  }) async {
    final url = Uri.parse('$baseUrlLogin/gantipassword');
    // final url = Uri.parse('$baseUrl/changepassword');

    try {
      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'id_user': idUser,
          'current_password': currentPassword,
          'new_password1': newPassword1,
          'new_password2': newPassword2,
        },
      );

      if (kDebugMode) print("ini response ${response.body}");

      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200 && jsonData['status'] == true) {
        return Right(jsonData['message']);
      } else {
        return Left(jsonData['message'] ?? 'Gagal mengubah password');
      }
    } catch (e) {
      return Left('Terjadi kesalahan: $e');
    }
  }

  Future<Either<String, ApiResponse<void>>> forgotPassword(String email) async {
    try {
      final resp = await _client.post(
        Uri.parse('$baseUrlLogin/forgotpassword'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      final api = ApiResponse.fromJson(jsonDecode(resp.body));

      return api.status
          ? Right(api) // ✅ sukses
          : Left(api.message); // ❌ gagal (pesan dari server)
    } catch (e) {
      return Left('Gagal menghubungi server: $e'); // ❌ error jaringan
    }
  }

  /// 2) Verifikasi token sebelum tampilkan form reset
  Future<Either<String, ApiResponse<void>>> verifyResetToken(
      String token) async {
    try {
      final resp = await _client.get(
        Uri.parse('$baseUrlLogin/verifyresettoken/$token'),
      );

      final api = ApiResponse.fromJson(jsonDecode(resp.body));

      return api.status ? Right(api) : Left(api.message);
    } catch (e) {
      return Left('Gagal verifikasi token: $e');
    }
  }

  /// 3) Reset password
  Future<Either<String, ApiResponse<void>>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      final resp = await _client.post(
        Uri.parse('$baseUrlLogin/resetpassword'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': token, 'password': newPassword}),
      );

      final api = ApiResponse.fromJson(jsonDecode(resp.body));

      return api.status ? Right(api) : Left(api.message);
    } catch (e) {
      return Left('Gagal reset password: $e');
    }
  }

  //akses admin
  Future<bool> hasApproveKasbon() async {
    final map = await _readActions();
    return map['akses_kasbon'] ?? false;
  }

  Future<bool> hasApproveAbsen() async {
    final map = await _readActions();
    return map['approved_absen'] ?? false;
  }

  Future<Map<String, bool>> _readActions() async {
    final raw = await _storage.read(key: 'actions');
    if (raw == null) return {};
    final dec = jsonDecode(raw) as Map<String, dynamic>;
    return dec.map((k, v) => MapEntry(k, v as bool));
  }

  void dispose() => _client.close();
}
