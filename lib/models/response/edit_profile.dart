// import 'dart:convert';

// class EditProfileResponse {
//     bool status;
//     String message;
//     Data data;

//     EditProfileResponse({
//         required this.status,
//         required this.message,
//         required this.data,
//     });

//     factory EditProfileResponse.fromJson(String str) => EditProfileResponse.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory EditProfileResponse.fromMap(Map<String, dynamic> json) => EditProfileResponse(
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromMap(json["data"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "status": status,
//         "message": message,
//         "data": data.toMap(),
//     };
// }

// class Data {
//     String ?nama;
//     String ?username;
//     String ?email;

//     Data({
//          this.nama,
//          this.username,
//          this.email,
//     });

//     factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Data.fromMap(Map<String, dynamic> json) => Data(
//         nama: json["nama"],
//         username: json["username"],
//         email: json["email"],
//     );

//     Map<String, dynamic> toMap() => {
//         "nama": nama,
//         "username": username,
//         "email": email,
//     };
// }
