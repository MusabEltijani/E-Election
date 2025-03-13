import 'package:e_election/data/model/profile_respones_model.dart';
import 'package:e_election/data/repository/profile_repository.dart';

class ProfileService {
  final ProfileRepository profileRepository;

  ProfileService(this.profileRepository);

  Future<ProfileResponseModel?> getProfile(String token) async {
    return await profileRepository.getProfile(token);
  }
}
