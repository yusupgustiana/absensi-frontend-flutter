import 'dart:convert';
import 'package:absensi/helper/variables.dart';
import 'package:absensi/presentation/absensi/models/list_absensi.dart';
import 'package:absensi/models/response/status_absensi.dart';
import 'package:absensi/models/response/status_check.dart';
import 'package:absensi/presentation/login/models/lupa_password_models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class AbsensiService {
  final http.Client _client;
  AbsensiService({http.Client? client}) : _client = client ?? http.Client();
  Future<Map<String, dynamic>> formAbsensi({
    required String idUser,
    required String tanggalFormatted,
    required String waktuFormatted,
    required String keterangan,
    required LocationData location,
    required String status,
  }) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/absensi/formabsensi'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'id_user': idUser,
        'tanggal': tanggalFormatted,
        'waktu': waktuFormatted,
        'keterangan': keterangan,
        'latitude': location.latitude.toString(),
        'longitude': location.longitude.toString(),
        'status': status,
      },
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> lupaCheckin({
    required String? idAbsen,
    required String idUser,
    required String tanggalFormatted,
    required String waktuFormatted,
    required String keterangan,
    required LocationData location,
  }) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/absensi/lupacheckin'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        "id": idAbsen ?? '',
        'id_user': idUser,
        'tanggal': tanggalFormatted,
        'waktu': waktuFormatted,
        'keterangan': keterangan,
        'latitude': location.latitude.toString(),
        'longitude': location.longitude.toString(),
      },
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> lupaCheckout({
    required String? idAbsen,
    required String idUser,
    required String tanggalFormatted,
    required String waktuFormatted,
    required String keterangan,
    required LocationData location,
  }) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/absensi/lupacheckout'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        "id": idAbsen ?? '',
        'id_user': idUser,
        'tanggal': tanggalFormatted,
        'waktu': waktuFormatted,
        'keterangan': keterangan,
        'latitude': location.latitude.toString(),
        'longitude': location.longitude.toString(),
      },
    );

    return jsonDecode(response.body);
  }

  Future<CheckStatus> kirimAbsen({
    required String idUser,
    required double latitude,
    required double longitude,
    required String imageBase64,
    String? status,
  }) async {
    final uri = Uri.parse('$baseUrl/absensi/kirimAbsen');
    if (kDebugMode) print(uri);
    final body = {
      'id_user': idUser,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'image': imageBase64,
      if (status != null && status != 'null') 'status': status,
    };

    if (kDebugMode) print('➡️ URL: $uri');
    if (kDebugMode) print('ini statusnya : $status');
    if (kDebugMode) print('➡️ Body yang dikirim ke server:');
    body.forEach((key, value) {
      if (key == 'image') {
        if (kDebugMode) print('$key: [BASE64 DIBERSIHKAN]');
      } else {
        if (kDebugMode) print('$key: $value');
      }
    });

    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );

    final result = jsonDecode(response.body);

    if (result['status'] != true) {
      throw Exception(result['message']);
    }

    return CheckStatus.fromMap(result);
  }

  Future<AbsensiTerakhirModel> absensiTerakhir(String idUser) async {
    final url = Uri.parse('$baseUrl/absensi/absensiTerakhir');

    try {
      final response = await _client.post(
        url,
        body: {
          'iduser': idUser,
        },
      );

      if (response.statusCode == 200) {
        if (kDebugMode) print("ini absen terakhir : ${response.body}");
        final jsonData = json.decode(response.body);
        return AbsensiTerakhirModel.fromJson(jsonData);
      } else {
        if (kDebugMode) print("ini absen terakhir : ${response.body}");
        throw Exception(
            'Gagal menghubungi server. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(
          'Terjadi kesalahan saat mengambil data absensi terakhir: $e');
    }
  }

  Future<List<DetailHistoryAbsensi>> historyAbsensi({
    required String idUser,
    required String tanggalDari,
    required String tanggalSampai,
  }) async {
    final uri = Uri.parse('$baseUrl/absensi/historyAbsensi');

    final body = {
      "id_user": idUser,
      "tanggaldari": tanggalDari,
      "tanggalsampai": tanggalSampai,
    };

    if (kDebugMode) print("POST URL: $uri");
    if (kDebugMode) print("Request Body: ${jsonEncode(body)}");

    try {
      final response = await _client.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (kDebugMode) {
        print("Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");
      }

      final Map<String, dynamic> data = jsonDecode(response.body);

      // Gunakan response.statusCode untuk cek HTTP-level error
      if (response.statusCode == 200) {
        // Validasi statusCode di dalam body (API-level)
        if (data['status'] == true || data['statusCode'] == "200") {
          final List absensiList = data['data'] ?? []; // jika nested
          return absensiList
              .map((json) => DetailHistoryAbsensi.fromMap(json))
              .toList();
        } else {
          final message = data['message'] ?? 'Data tidak ditemukan.';
          throw Exception(message);
        }
      } else {
        final message = data['message'] ?? 'Terjadi kesalahan server.';
        throw Exception(
            '[${data['statusCode'] ?? response.statusCode}] $message');
      }
    } catch (e) {
      if (kDebugMode) print("Error: $e");
      throw Exception('Terjadi kesalahan saat memuat data: $e');
    }
  }

  Future<ApiResponse> approveAbsensi(String idUser, List<String> ids) async {
    final url = Uri.parse('$baseUrl/confirmabsensi');

    final payload = {
      'id_user': idUser,
      'id': ids.map((e) => e.toString()).toList(),
    };

    if (kDebugMode) {
      print('URL: $url');
      print('Payload yang dikirim: $payload');
    }

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      if (kDebugMode) {
        print('Raw response: ${response.body}');
        print('Status code: ${response.statusCode}');
      }

      if (response.statusCode != 200) {
        throw Exception(
          'Gagal menyambung ke server. Kode: ${response.statusCode}',
        );
      }

      final data = jsonDecode(response.body);

      if (data['status'] != true) {
        throw Exception(data['message'] ?? 'Permintaan gagal.');
      }

      return ApiResponse.fromJson(data);
    } catch (e, stackTrace) {
      // ✅ Cetak error lengkap
      if (kDebugMode) {
        print('Terjadi error saat approve absensi: $e');
        print('StackTrace: $stackTrace');
      }

      throw Exception('Terjadi kesalahan saat approve absensi: $e');
    }
  }

  void dispose() => _client.close();
}
