// import 'dart:convert';

// Future<bool> hasApproveKasbon() async {
//   final map = await _readActions();
//   return map['approved_kasbon_karyawan'] ?? false;
// }

// Future<bool> hasApproveAbsen() async {
//   final map = await _readActions();
//   return map['approved_absensi_karyawan'] ?? false;
// }

// Future<Map<String,bool>> _readActions() async {
//   final raw = await _storage.read(key: 'actions');
//   if (raw == null) return {};
//   final dec = jsonDecode(raw) as Map<String,dynamic>;
//   return dec.map((k,v)=>MapEntry(k, v as bool));
// }
