// import 'dart:convert';

// class HistoryKasbonResponse {
//     bool status;
//     List<DetailHistoryKasbon> data;

//     HistoryKasbonResponse({
//         required this.status,
//         required this.data,
//     });

//     factory HistoryKasbonResponse.fromJson(String str) => HistoryKasbonResponse.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory HistoryKasbonResponse.fromMap(Map<String, dynamic> json) => HistoryKasbonResponse(
//         status: json["status"],
//         data: List<DetailHistoryKasbon>.from(json["data"].map((x) => DetailHistoryKasbon.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "status": status,
//         "data": List<dynamic>.from(data.map((x) => x.toMap())),
//     };
// }

// class DetailHistoryKasbon {
//     String idPinjaman;
//     String idUser;
//     String jumlah;
//     String keterangan;
//     String status;
//     DateTime tanggalPengajuan;
//     DateTime tanggalUpdate;

//     DetailHistoryKasbon({
//         required this.idPinjaman,
//         required this.idUser,
//         required this.jumlah,

//         required this.keterangan,
//         required this.status,
//         required this.tanggalPengajuan,
//         required this.tanggalUpdate,
//     });

//     factory DetailHistoryKasbon.fromJson(String str) => DetailHistoryKasbon.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory DetailHistoryKasbon.fromMap(Map<String, dynamic> json) => DetailHistoryKasbon(
//         idPinjaman: json["id_pinjaman"],
//         idUser: json["id_user"],
//         jumlah: json["jumlah"],

//         keterangan: json["keterangan"],
//         status: json["status"],
//         tanggalPengajuan: DateTime.parse(json["tanggal_pengajuan"]),
//         tanggalUpdate: DateTime.parse(json["tanggal_update"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "id_pinjaman": idPinjaman,
//         "id_user": idUser,
//         "jumlah": jumlah,
   
//         "keterangan": keterangan,
//         "status": status,
//         "tanggal_pengajuan": tanggalPengajuan.toIso8601String(),
//         "tanggal_update": tanggalUpdate.toIso8601String(),
//     };
// }
