import 'dart:convert';

import 'package:absensi/helper/variables.dart';
import 'package:absensi/models/request/edit_profile_request.dart';
import 'package:absensi/models/response/profile.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProfileServices {
  final http.Client _client;

  ProfileServices({http.Client? client}) : _client = client ?? http.Client();
  Future<Either<String, ProfileModel>> editProfile(
      EditProfileRequest editProfile) async {
    final uri = Uri.parse('$baseUrlProfile/profile/update');

    try {
      final request = http.MultipartRequest('POST', uri)
        ..fields['id'] = editProfile.id.toString()
        ..fields['name'] = editProfile.name ?? ''
        ..fields['username'] = editProfile.username ?? ''
        ..fields['email'] = editProfile.email ?? '';

      if (editProfile.image != null) {
        request.files.add(
          await http.MultipartFile.fromPath('image', editProfile.image!.path),
        );
      }

      // ✅ re‑use client
      final streamedResponse = await _client.send(request);
      final responseString = await streamedResponse.stream.bytesToString();
      final jsonMap = json.decode(responseString);

      if (streamedResponse.statusCode == 200 && jsonMap['success'] == true) {
        return Right(ProfileModel.fromMap(jsonMap));
      } else {
        return Left(jsonMap['message'] ?? 'Gagal edit profil');
      }
    } catch (e) {
      return Left('Terjadi kesalahan: $e');
    }
  }

  Future<Either<String, ProfileModel>> getProfile(String idUser) async {
    final url = Uri.parse('$baseUrlProfile/profile/getProfile?id_user=$idUser');

    try {
      final response = await _client.get(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      final jsonMap = json.decode(response.body);

      if (response.statusCode == 200 && jsonMap['success'] == true) {
        final profile =
            ProfileModel.fromMap(jsonMap); // ⬅️ Ambil seluruh response
        return Right(profile);
      } else {
        final errorMessage = jsonMap['message'] ?? 'Gagal memuat profil';
        return Left(errorMessage);
      }
    } catch (e) {
      if (kDebugMode) print(e);
      return Left('Terjadi kesalahan: $e');
    }
  }
}
