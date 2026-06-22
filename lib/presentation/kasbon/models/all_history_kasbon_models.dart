import 'dart:convert';

class AllHistoryKasbon {
  bool? status;
  String? message;
  List<DetailHistoryKasbon>? data;

  AllHistoryKasbon({
    this.status,
    this.message,
    this.data,
  });

  factory AllHistoryKasbon.fromJson(String str) =>
      AllHistoryKasbon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllHistoryKasbon.fromMap(Map<String, dynamic> json) =>
      AllHistoryKasbon(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DetailHistoryKasbon>.from(
                json["data"]!.map((x) => DetailHistoryKasbon.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DetailHistoryKasbon {
  int? idKasbon;
  int? idUser;
  String? namaUser;
  String? jumlah;
  String? keterangan;
  String? statusPengajuan;
  String? statusPembayaran;
  String? buktiTransfer;
  String? tanggalPengajuan;
  String? createdAt;
  String? updatedAt;
  String? tanggalDisetujui;
  String? tanggalDitolak;
  String? tanggalLunas;

  DetailHistoryKasbon({
    this.idKasbon,
    this.idUser,
    this.namaUser,
    this.jumlah,
    this.keterangan,
    this.statusPengajuan,
    this.statusPembayaran,
    this.buktiTransfer,
    this.tanggalPengajuan,
    this.createdAt,
    this.updatedAt,
    this.tanggalDisetujui,
    this.tanggalDitolak,
    this.tanggalLunas,
  });

  factory DetailHistoryKasbon.fromJson(String str) =>
      DetailHistoryKasbon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailHistoryKasbon.fromMap(Map<String, dynamic> json) =>
      DetailHistoryKasbon(
        idKasbon: json["id_kasbon"],
        idUser: json["id_user"],
        namaUser: json["nama_user"],
        jumlah: json["jumlah"],
        keterangan: json["keterangan"],
        statusPengajuan: json["status_pengajuan"],
        statusPembayaran: json["status_pembayaran"],
        buktiTransfer: json["bukti_transfer"],
        tanggalPengajuan: json["tanggal_pengajuan"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        tanggalDisetujui: json["tanggal_disetujui"],
        tanggalDitolak: json["tanggal_ditolak"],
        tanggalLunas: json["tanggal_lunas"],
      );

  Map<String, dynamic> toMap() => {
        "id_kasbon": idKasbon,
        "id_user": idUser,
        "nama_user": namaUser,
        "jumlah": jumlah,
        "keterangan": keterangan,
        "status_pengajuan": statusPengajuan,
        "status_pembayaran": statusPembayaran,
        "bukti_transfer": buktiTransfer,
        "tanggal_pengajuan": tanggalPengajuan,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "tanggal_disetujui": tanggalDisetujui,
        "tanggal_ditolak": tanggalDitolak,
        "tanggal_lunas": tanggalLunas,
      };
}
