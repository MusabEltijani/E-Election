import 'package:dio/dio.dart';
import 'package:e_election/app/language/language_manager.dart';
import 'package:e_election/data/model/api_respones_model.dart';
import 'package:e_election/data/model/candidates_respones_model.dart';
import 'package:e_election/data/remote/service/api_service.dart';
import 'package:e_election/data/repository/base_repository.dart';

class CandidatesRepository extends BaseRepository {
  final ApiService _apiService;

  CandidatesRepository(this._apiService);

  Future<CandidatesResponseModel> getCandidates(String token) async {
    var httpResponse;
    try {
      httpResponse = await _apiService.getCandidates(token);
      return httpResponse;
    } on DioException catch (e) {
      final res = e.response;
      throwExceptionByStatusCode(res?.statusCode, res?.statusMessage ?? "");
    } catch (e) {
      rethrow;
    }
    return httpResponse;
  }

  Future<CandidatesResponseModel> getCandidatesById(
      String token, int candidateId) async {
    var httpResponse;
    try {
      httpResponse = await _apiService.getCandidatesById(token, candidateId);
      return httpResponse;
    } on DioException catch (e) {
      final res = e.response;
      throwExceptionByStatusCode(res?.statusCode, res?.statusMessage ?? "");
    } catch (e) {
      rethrow;
    }
    return httpResponse;
  }

  Future<ApiResponse?> vote(String candidateId, String token) async {
    var httpResponse;
    try {
      httpResponse = await _apiService.vote(token, candidateId);
    } on DioException catch (e) {
      final res = e.response;
      throwExceptionByStatusCode(res?.statusCode, res?.statusMessage ?? "");
    } catch (e) {
      rethrow;
    }
    return httpResponse;
  }
}
