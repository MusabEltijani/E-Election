import 'package:e_election/app/di/injector.dart';
import 'package:e_election/services/app_user_service.dart';
import 'package:e_election/services/authentication_service.dart';
import 'package:e_election/services/candidates_service.dart';
import 'package:e_election/services/profile_service.dart';
import 'package:e_election/services/on_boarding_service.dart';

Future<void> registerService() async {
  injector.registerFactory<AppUserService>(() => AppUserService(injector()));

  injector.registerFactory<AuthenticationService>(
      () => AuthenticationService(injector()));

  injector
      .registerFactory<OnBoardingService>(() => OnBoardingService(injector()));

  injector.registerFactory<ProfileService>(() => ProfileService(injector()));

  injector
      .registerFactory<CandidatesService>(() => CandidatesService(injector()));
}
