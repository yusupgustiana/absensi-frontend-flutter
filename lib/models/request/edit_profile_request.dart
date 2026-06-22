import 'dart:io';

class EditProfileRequest {
  final int id;
  final String? name;
  final String? username;
  final String? email;
  final File? image;

  EditProfileRequest({
    required this.id,
    this.name,
    this.username,
    this.email,
    this.image,
  });

  Map<String, String> toMap() {
    return {
      'id': id.toString(),
      'name': name ?? '',
      'username': username ?? '',
      'email': email ?? '',
    };
  }
}
