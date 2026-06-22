import 'dart:convert';
import 'dart:io';
import 'package:absensi/helper/variables.dart';
import 'package:absensi/presentation/kasbon/models/all_history_kasbon_models.dart';
import 'package:absensi/presentation/login/models/lupa_password_models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

class KasbonService {
  final http.Client _client;

  KasbonService({http.Client? client}) : _client = client ?? http.Client();

  /// services/kasbon_service.dart
  Future<ApiResponse> uploadBuktiTransfer({
    required int idKasbon,
    required File file,
  }) async {
    final uri = Uri.parse('$baseUrl/kasbon/uploadBuktiTransfer');

    final request = http.MultipartRequest('POST', uri)
      ..fields['id_kasbon'] = idKasbon.toString()
      ..files.add(await http.MultipartFile.fromPath(
        'bukti',
        file.path,
        contentType: MediaType.parse(
          lookupMimeType(file.path) ?? 'image/jpeg',
        ),
        filename: path.basename(file.path),
      ));

    // Kirim request ➜ dapat StreamedResponse
    final streamed = await _client.send(request);

    // Konversi ke http.Response supaya gampang dibaca bodynya
    final response = await http.Response.fromStream(streamed);

    // Kalau server unreachable / status HTTP bukan 200
    if (response.statusCode != 200) {
      // Boleh lempar exception, boleh dibungkus ApiResponse juga
      throw Exception('${response.statusCode}');
    }

    // Decode JSON
    final Map<String, dynamic> jsonBody = jsonDecode(response.body);

    return ApiResponse.fromJson(jsonBody);
  }

  Future<Map<String, dynamic>> ajukanKasbon({
    required int idUser,
    required String jumlah,
    String? keterangan,
    required String nama,
  }) async {
    final url = Uri.parse("$baseUrl/kasbon/pengajuan");

    if (kDebugMode) print('Request URL: $url');
    if (kDebugMode) {
      print('Request Body: ${jsonEncode({
            "id_user": idUser,
            "nama_user": nama,
            "jumlah": jumlah,
            "keterangan": keterangan,
          })}');
    }

    final response = await _client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "id_user": idUser,
        "nama_user": nama,
        "jumlah": jumlah,
        "keterangan": keterangan,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (kDebugMode) print('Response Status: ${response.statusCode}');
      if (kDebugMode) print('Response Body: ${response.body}');
      throw Exception("Gagal mengajukan kasbon ${response.body}");
    }
  }

  Future<Either<String, List<DetailHistoryKasbon>>> getHistoryKasbon(
      String idUser) async {
    try {
      final url = Uri.parse('$baseUrl/kasbon/history?id_user=$idUser');
      if (kDebugMode) print('🔗 Request URL: $url');

      final response = await _client.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json is Map && json['data'] is List) {
          final List dataList = json['data'];
          final list =
              dataList.map((e) => DetailHistoryKasbon.fromMap(e)).toList();
          return Right(list);
        } else {
          return const Left('Format respons tidak sesuai');
        }
      } else {
        return Left('Gagal memuat data. Status: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Terjadi error saat getHistoryKasbon: $e');
      return Left('Terjadi kesalahan: $e');
    }
  }

//Admin
  Future<Either<String, List<DetailHistoryKasbon>>> getSemuaKasbon() async {
    try {
      final url = Uri.parse('$baseUrl/kasbon/allHistory');
      if (kDebugMode) print('🔗 Request URL: $url');

      final response = await _client.get(url);
      if (response.statusCode == 200) {
        debugPrint('[DEBUG] semuahistory: $url');
        final json = jsonDecode(response.body);
        if (json is Map && json['data'] is List) {
          final List dataList = json['data'];
          final list =
              dataList.map((e) => DetailHistoryKasbon.fromMap(e)).toList();
          return Right(list);
        } else {
          return const Left('Format respons tidak sesuai');
        }
      } else {
        return Left('Gagal memuat data. Status: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) print('Terjadi error saat getHistoryKasbon: $e');
      return Left('Terjadi kesalahan: $e');
    }
  }

// Admin
  Future<Map<String, dynamic>> setujuiKasbon(int idKasbon) async {
    final url = Uri.parse('$baseUrl/kasbon/setujui');

    try {
      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'id_kasbon': idKasbon.toString(),
        },
      );

      final result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          'status': result['status'],
          'message': result['message'],
        };
      }

      return {'status': false, 'message': 'Gagal menyetujui kasbon'};
    } catch (e) {
      if (kDebugMode) {
        print('Error setujui kasbon: $e');
      }

      return {'status': false, 'message': e.toString()};
    }
  }

// Admin
  Future<Map<String, dynamic>> tolakKasbon(int idKasbon) async {
    final url = Uri.parse('$baseUrl/kasbon/tolak');

    try {
      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'id_kasbon': idKasbon.toString(),
        },
      );

      final result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          'status': result['status'],
          'message': result['message'],
        };
      }

      return {'status': false, 'message': 'Gagal menolak kasbon'};
    } catch (e) {
      if (kDebugMode) {
        print('Error tolak kasbon: $e');
      }

      return {'status': false, 'message': e.toString()};
    }
  }

// Admin
  Future<Map<String, dynamic>> lunaskanKasbon(int idKasbon) async {
    final url = Uri.parse('$baseUrl/kasbon/lunas');

    try {
      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {'id_kasbon': idKasbon.toString()},
      );

      final result = jsonDecode(response.body);

      return {'status': result['status'], 'message': result['message']};
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }

  void dispose() => _client.close();
}
