import 'package:dio/dio.dart';
import 'package:e_election/data/model/api_respones_model.dart';
import 'package:e_election/data/model/candidate_response_model.dart';
import 'package:e_election/data/model/candidates_respones_model.dart';
import 'package:e_election/data/model/on_boarding_respones_model.dart';
import 'package:e_election/data/model/generate_login_code_model.dart';
import 'package:e_election/data/model/pass_port_verification_model.dart';
import 'package:e_election/data/model/profile_respones_model.dart';
import 'package:e_election/data/remote/api_constant.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiEndPoints.generateLoginCode)
  Future<GenerateLoginCodeModel> generateLoginCode(
      @Field('id_number') String idNumber);

  @POST(ApiEndPoints.codeVerification)
  Future<PassPortVerificationModel> verificationLoginCode(
      @Field('id_number') String idNumber, @Field('code') String code);

  @GET(ApiEndPoints.profile)
  Future<ProfileResponseModel> getProfile(
      @Header('Authorization') String token);

  @GET(ApiEndPoints.onboarding)
  Future<OnboardingResponseModel> onBoarding();

  @GET('${ApiEndPoints.candidates}/{id}')
  Future<CandidateResponseModel> getCandidatesById(
      @Header('Authorization') String token, @Path("id") int candidateId);

  @GET(ApiEndPoints.candidates)
  Future<CandidatesResponseModel> getCandidates(
    @Header('Authorization') String token,
  );

  @POST(ApiEndPoints.vote)
  Future<ApiResponse> vote(@Header('Authorization') String token,
      @Field("candidate_id") String candidateId);
}
