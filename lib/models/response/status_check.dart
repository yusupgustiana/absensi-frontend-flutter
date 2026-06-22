import 'dart:convert';

class CheckStatus {
  bool status;
  String? statusCode;
  String message;

  CheckStatus({
    required this.status,
    this.statusCode,
    required this.message,
  });

  factory CheckStatus.fromJson(String str) =>
      CheckStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckStatus.fromMap(Map<String, dynamic> json) => CheckStatus(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
      };
}
