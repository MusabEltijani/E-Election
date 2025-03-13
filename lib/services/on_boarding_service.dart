import 'package:e_election/data/model/on_boarding_respones_model.dart';
import 'package:e_election/data/repository/on_boarding_repository.dart';

class OnBoardingService {
  OnBoardingRepository onBoardingRepository;
  OnBoardingService(this.onBoardingRepository);

  Future<OnboardingResponseModel?> getOnBoarding() async {
    return await onBoardingRepository.onBoarding();
  }
}
