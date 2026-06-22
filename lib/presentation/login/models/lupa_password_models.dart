class ApiResponse<T> {
  final bool status;
  final String? statusCode;
  final String message;
  final T? data;

  ApiResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] as bool,
      statusCode: json['statusCode'],
      message: json['message'] as String,
      data: json['data'], // boleh null
    );
  }
}
