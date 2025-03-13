import 'package:dio/dio.dart';
import 'package:e_election/data/model/profile_respones_model.dart';
import 'package:e_election/data/remote/service/api_service.dart';
import 'package:e_election/data/repository/base_repository.dart';

class ProfileRepository extends BaseRepository {
  final ApiService _apiService;

  ProfileRepository(this._apiService);

  Future<ProfileResponseModel> getProfile(String token) async {
    var httpResponse;
    try {
      httpResponse = await _apiService.getProfile(token);
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
