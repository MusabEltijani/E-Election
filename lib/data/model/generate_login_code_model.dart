class GenerateLoginCodeModel {
  final List<dynamic> data;
  final String message;
  final int status;

  GenerateLoginCodeModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory GenerateLoginCodeModel.fromJson(Map<String, dynamic> json) {
    return GenerateLoginCodeModel(
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
