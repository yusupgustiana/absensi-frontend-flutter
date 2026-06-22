import 'dart:convert';

class HistoryAbsensiModels {
  bool? success;
  String? message;
  int? statusCode;
  List<DetailHistoryAbsensi>? data;

  HistoryAbsensiModels({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory HistoryAbsensiModels.fromJson(String str) =>
      HistoryAbsensiModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryAbsensiModels.fromMap(Map<String, dynamic> json) =>
      HistoryAbsensiModels(
        success: json["success"],
        message: json["message"],
        statusCode: json["statusCode"],
        data: json["data"] == null
            ? []
            : List<DetailHistoryAbsensi>.from(
                json["data"]!.map((x) => DetailHistoryAbsensi.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        'statusCode': statusCode,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DetailHistoryAbsensi {
  String? id;
  int? idUser;
  String? nama;
  String? tanggal;
  String? checkinTime;
  String? checkoutTime;
  int? checkinApproved;
  int? checkoutApproved;
  String? checkinDeskripsi;
  String? checkoutDeskripsi;

  DetailHistoryAbsensi({
    this.id,
    this.idUser,
    this.nama,
    this.tanggal,
    this.checkinTime,
    this.checkoutTime,
    this.checkinApproved,
    this.checkoutApproved,
    this.checkinDeskripsi,
    this.checkoutDeskripsi,
  });

  factory DetailHistoryAbsensi.fromJson(String str) =>
      DetailHistoryAbsensi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailHistoryAbsensi.fromMap(Map<String, dynamic> json) =>
      DetailHistoryAbsensi(
          id: json["id"],
          idUser: json["id_user"],
          nama: json["nama"],
          tanggal: json["tanggal"],
          checkinTime: json["checkin_time"],
          checkoutTime: json["checkout_time"],
          checkinApproved: json["checkin_approved"],
          checkoutApproved: json["checkout_approved"],
          checkinDeskripsi: json["checkin_deskripsi"],
          checkoutDeskripsi: json["checkout_deskripsi"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_user": idUser,
        "nama": nama,
        "tanggal": tanggal,
        "checkin_time": checkinTime,
        "checkout_time": checkoutTime,
        "checkin_approved": checkinApproved,
        "checkout_approved": checkoutApproved,
        "checkin_deskripsi": checkinDeskripsi,
        "checkout_deskripsi": checkoutDeskripsi
      };
}
