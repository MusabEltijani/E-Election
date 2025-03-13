class Urls {
  static const String baseUrl = "https://zool.spatiulab.com/api/";

  static const String imageUrl = '';
}

abstract class ApiEndPoints {
  /// auth end points
  static const String generateLoginCode = 'citizens/generate-code';
  static const String codeVerification = 'citizens/verification';

  /// onboarding end point
  static const String onboarding = 'onboarding';

  static const String profile = 'citizens/profile';

  /// election end points

  static const String candidates = 'election/candidates';
  static const String candidateById = 'election/candidates/';
  static const String vote = 'election/vote';
}
