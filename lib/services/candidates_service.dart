import 'package:e_election/data/model/api_respones_model.dart';
import 'package:e_election/data/model/candidates_respones_model.dart';
import 'package:e_election/data/repository/candidates_repository.dart';

class CandidatesService {
  CandidatesRepository candidatesRepository;

  CandidatesService(this.candidatesRepository);

  Future<CandidatesResponseModel?> getCandidates(String token) async {
    return await candidatesRepository.getCandidates(token);
  }

  Future<CandidatesResponseModel?> getCandidatesById(
      String token, int candidateId) async {
    return await candidatesRepository.getCandidatesById(token, candidateId);
  }

  Future<ApiResponse?> vote(String candidateId, String token) async {
    return await candidatesRepository.vote(candidateId, token);
  }
}
