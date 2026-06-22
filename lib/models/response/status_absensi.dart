class AbsensiTerakhirModel {
  final bool status;
  final String message;
  String? statusCode;
  final AbsensiData? data;

  AbsensiTerakhirModel({
    required this.status,
    required this.message,
    this.statusCode,
    this.data,
  });

  factory AbsensiTerakhirModel.fromJson(Map<String, dynamic> json) {
    return AbsensiTerakhirModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      statusCode: json["statusCode"],
      data: json['data'] != null
          ? AbsensiData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'statusCode': statusCode,
        'data': data?.toJson(),
      };
}

class AbsensiData {
  final String? jenisAbsensi;
  final String? tanggal;
  final String? checkinTime;
  final String? checkoutTime;

  AbsensiData({
    this.jenisAbsensi,
    this.tanggal,
    this.checkinTime,
    this.checkoutTime,
  });

  factory AbsensiData.fromJson(Map<String, dynamic> json) {
    return AbsensiData(
      jenisAbsensi: json['jenisabsensi'] as String?,
      tanggal: json['tanggal'] as String?,
      checkinTime: json['checkin_time'] as String?,
      checkoutTime: json['checkout_time'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'jenisabsensi': jenisAbsensi,
        'tanggal': tanggal,
        'checkin_time': checkinTime,
        'checkout_time': checkoutTime,
      };
}
