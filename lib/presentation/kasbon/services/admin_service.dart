// import 'package:absensi/helper/base_url.dart';
// import 'package:absensi/presentation/kasbon/models/all_history_kasbon_models.dart';
// import 'package:absensi/presentation/setting/models/history_kasbon_response.dart';
// import 'package:dartz/dartz.dart';
// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class AdminKasbonService {
// // ganti baseKasbon sesuai hostmu

//   Future<Either<String, List<DetailHistoryKasbon>>> getSemuaKasbon() async {
//     try {
//       final url = Uri.parse('$baseKasbon/allhistory');
//       if (kDebugMode) print('🔗 Request URL: $url');

//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final json = jsonDecode(response.body);
//         if (json is Map && json['data'] is List) {
//           final List dataList = json['data'];
//           final list =
//               dataList.map((e) => DetailHistoryKasbon.fromMap(e)).toList();
//           return Right(list);
//         } else {
//           return Left('Format respons tidak sesuai');
//         }
//       } else {
//         return Left('Gagal memuat data. Status: ${response.statusCode}');
//       }
//     } catch (e) {
//       if (kDebugMode) print('Terjadi error saat getHistoryKasbon: $e');
//       return Left('Terjadi kesalahan: $e');
//     }
//   }

//   Future<bool> setujuiKasbon(String idPinjaman) async {
//     final url = Uri.parse("$baseKasbon/setujui");
//     final response = await http.post(url, body: {'id_pinjaman': idPinjaman});
//     return response.statusCode == 200;
//   }

//   Future<bool> tolakKasbon(String idPinjaman) async {
//     final url = Uri.parse("$baseKasbon/tolak");
//     final response = await http.post(url, body: {'id_pinjaman': idPinjaman});
//     return response.statusCode == 200;
//   }


// }
