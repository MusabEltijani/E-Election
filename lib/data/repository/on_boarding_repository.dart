import 'package:dio/dio.dart';
import 'package:e_election/data/model/on_boarding_respones_model.dart';
import 'package:e_election/data/remote/service/api_service.dart';
import 'package:e_election/data/repository/base_repository.dart';

class OnBoardingRepository extends BaseRepository {
  final ApiService _apiService;

  OnBoardingRepository(this._apiService);

  Future<OnboardingResponseModel> onBoarding() async {
    var httpResponse;
    try {
      httpResponse = await _apiService.onBoarding();
      return httpResponse;
    } on DioException catch (e) {
      final res = e.response;
      throwExceptionByStatusCode(res?.statusCode, res?.statusMessage ?? "");
    } catch (e) {
      rethrow;
    }
    return httpResponse;
  }
}
