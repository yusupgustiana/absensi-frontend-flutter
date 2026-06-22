// import 'dart:convert';
// import 'package:absensi/helper/base_url.dart';
// import 'package:http/http.dart' as http;

// class AbsensiApprovalResult {
//   final bool success;
//   final String message;

//   const AbsensiApprovalResult({required this.success, required this.message});

//   factory AbsensiApprovalResult.fromJson(Map<String, dynamic> json) {
//     return AbsensiApprovalResult(
//       success: json['success'] as bool? ?? false,
//       message:
//           json['message'] as String? ?? 'Terjadi kesalahan tidak diketahui',
//     );
//   }

//   @override
//   String toString() =>
//       'AbsensiApprovalResult(success: $success, message: $message)';
// }

// class AbsensiApprovalException implements Exception {
//   final String message;
//   AbsensiApprovalException(this.message);
//   @override
//   String toString() => 'AbsensiApprovalException: $message';
// }

// class AbsensiApprovalService {

//   final http.Client _client;

//   AbsensiApprovalService({ http.Client? client})
//       : _client = client ?? http.Client();

//   Future<AbsensiApprovalResult> approveAbsensi({
//     required String adminId,
//     required List<String> absensiIds,
//   }) async {
//     final uri = Uri.parse('$baseUrl/confirmabsensi');

//     final payload = <String, dynamic>{
//       'id_user': adminId,
//       'id': absensiIds,
//     };

//     try {
//       final response = await _client.post(
//         uri,
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(payload),
//       );

//       if (response.statusCode != 200) {
//         throw AbsensiApprovalException(
//           'HTTP ${response.statusCode}: ${response.reasonPhrase}',
//         );
//       }

//       final Map<String, dynamic> json = jsonDecode(response.body);
//       final result = AbsensiApprovalResult.fromJson(json);

//       if (!result.success) {
//         throw AbsensiApprovalException(result.message);
//       }

//       return result;
//     } on AbsensiApprovalException {
//       rethrow;
//     } catch (e) {
//       throw AbsensiApprovalException('Gagal memproses approval absensi: $e');
//     }
//   }

//   void dispose() {
//     _client.close();
//   }
// }
