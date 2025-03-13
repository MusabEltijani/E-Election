import 'package:dio/dio.dart';
import 'package:e_election/data/model/generate_login_code_model.dart';
import 'package:e_election/data/model/pass_port_verification_model.dart';
import 'package:e_election/data/remote/service/api_service.dart';
import 'package:e_election/data/repository/base_repository.dart';

class AuthentiocationRepository extends BaseRepository {
  final ApiService _apiService;

  AuthentiocationRepository(this._apiService);

  Future<GenerateLoginCodeModel> generateLoginCode(String idNumber) async {
    var httpResponse;
    try {
      httpResponse = await _apiService.generateLoginCode(idNumber);
      return httpResponse;
    } on DioException catch (e) {
      final res = e.response;
      print(res);
      throwExceptionByStatusCode(res?.statusCode, res?.statusMessage ?? "");
    } catch (e) {
      rethrow;
    }
    return httpResponse;
  }

  Future<PassPortVerificationModel> verificationLoginCode(
      String idNumber, String code) async {
    var httpResponse;
    try {
      httpResponse = await _apiService.verificationLoginCode(idNumber, code);
      return httpResponse;
    } on DioException catch (e) {
      final res = e.response;
      throwExceptionByStatusCode(res?.statusCode, res?.statusMessage);
    } catch (e) {
      rethrow;
    }
    return httpResponse;
  }
}
