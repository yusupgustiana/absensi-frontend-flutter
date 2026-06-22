import 'dart:convert';

class ProfileModel {
  bool success;
  DetailProfileModel detailProfileModel;

  ProfileModel({
    required this.success,
    required this.detailProfileModel,
  });

  factory ProfileModel.fromJson(String str) =>
      ProfileModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        detailProfileModel: DetailProfileModel.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": detailProfileModel.toMap(),
      };
}

class DetailProfileModel {
  int? idUser;
  int? idKaryawan;
  String? nama;
  String? email;
  String? username;
  String? image;
  String? password;
  int? roleId;
  int? isActive;
  int? jenisakun;
  String? tanggalDaftar;
  dynamic resetToken;
  dynamic resetTokenExpiration;

  DetailProfileModel({
    this.idUser,
    this.idKaryawan,
    this.nama,
    this.email,
    this.username,
    this.image,
    this.password,
    this.roleId,
    this.isActive,
    this.jenisakun,
    this.tanggalDaftar,
    this.resetToken,
    this.resetTokenExpiration,
  });

  factory DetailProfileModel.fromJson(String str) =>
      DetailProfileModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailProfileModel.fromMap(Map<String, dynamic> json) =>
      DetailProfileModel(
        idUser: json["id_user"],
        idKaryawan: json["id_karyawan"],
        nama: json["nama"],
        email: json["email"],
        username: json["username"],
        image: json["image"],
        password: json["password"],
        roleId: json["role_id"],
        isActive: json["is_active"],
        jenisakun: json["jenisakun"],
        tanggalDaftar: json["tanggal_daftar"],
        resetToken: json["reset_token"],
        resetTokenExpiration: json["reset_token_expiration"],
      );

  Map<String, dynamic> toMap() => {
        "id_user": idUser,
        "id_karyawan": idKaryawan,
        "nama": nama,
        "email": email,
        "username": username,
        "image": image,
        "password": password,
        "role_id": roleId,
        "is_active": isActive,
        "jenisakun": jenisakun,
        "tanggal_daftar": tanggalDaftar,
        "reset_token": resetToken,
        "reset_token_expiration": resetTokenExpiration,
      };
}
