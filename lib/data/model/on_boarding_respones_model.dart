class OnboardingResponseModel {
  final List<OnboardingData> data;
  final String message;
  final int status;

  OnboardingResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory OnboardingResponseModel.fromJson(Map<String, dynamic> json) {
    return OnboardingResponseModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => OnboardingData.fromJson(e))
              .toList() ??
          [],
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'message': message,
      'status': status,
    };
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String avatar;

  OnboardingData({
    required this.title,
    required this.description,
    required this.avatar,
  });

  factory OnboardingData.fromJson(Map<String, dynamic> json) {
    return OnboardingData(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'avatar': avatar,
    };
  }
}
