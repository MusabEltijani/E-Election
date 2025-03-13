import 'package:e_election/data/model/generate_login_code_model.dart';
import 'package:e_election/data/model/pass_port_verification_model.dart';
import 'package:e_election/data/repository/authentiocation_repository.dart';

class AuthenticationService {
  final AuthentiocationRepository authentiocationRepository;

  AuthenticationService(this.authentiocationRepository);

  Future<GenerateLoginCodeModel> generateLoginCode(String idNumber) async {
    return await authentiocationRepository.generateLoginCode(idNumber);
  }

  Future<PassPortVerificationModel> verificationLoginCode(
      String idNumber, String code) async {
    return await authentiocationRepository.verificationLoginCode(
        idNumber, code);
  }
}
