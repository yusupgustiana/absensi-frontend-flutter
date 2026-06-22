import 'dart:convert';

class UserModel {
  final bool status;
  final String message;
  final User user;
  final Map<String, bool> actions;

  UserModel({
    required this.status,
    required this.message,
    required this.user,
    required this.actions,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        user: User.fromMap(json["user"]),
        actions: Map<String, bool>.from(json["actions"] ?? {}),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "user": user.toMap(),
        "actions": actions,
      };
}

class User {
  final String idUser;
  final String idKaryawan;
  final String username;
  final String nama;
  final String roleId;
  final String image;

  User({
    required this.idUser,
    required this.idKaryawan,
    required this.username,
    required this.nama,
    required this.roleId,
    required this.image,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        idUser: json["id_user"] ?? '',
        idKaryawan: json["id_karyawan"] ?? '',
        username: json["username"] ?? '',
        nama: json["nama"] ?? '',
        roleId: json["role_id"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id_user": idUser,
        "id_karyawan": idKaryawan,
        "username": username,
        "nama": nama,
        "role_id": roleId,
        "image": image,
      };
}
