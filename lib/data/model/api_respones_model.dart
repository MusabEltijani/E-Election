class ApiResponse {
  final List<dynamic> data;
  final String message;
  final int status;

  ApiResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: json['data'] ?? [],
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'message': message,
      'status': status,
    };
  }
}
