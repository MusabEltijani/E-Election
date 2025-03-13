class PassPortVerificationModel {
  final Data data;
  final String message;
  final int status;

  PassPortVerificationModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory PassPortVerificationModel.fromJson(Map<String, dynamic> json) {
    return PassPortVerificationModel(
      data: Data.fromJson(json['data']),
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

class Data {
  final String token;

  Data({required this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
