import 'package:e_election/app/di/injector.dart';
import 'package:e_election/data/repository/app_user_repository.dart';
import 'package:e_election/data/repository/authentiocation_repository.dart';
import 'package:e_election/data/repository/candidates_repository.dart';
import 'package:e_election/data/repository/on_boarding_repository.dart';
import 'package:e_election/data/repository/profile_repository.dart';

Future<void> registerRepositories() async {
  injector
      .registerFactory<AppUserRepository>(() => AppUserRepository(injector()));

  injector.registerFactory<AuthentiocationRepository>(
      () => AuthentiocationRepository(injector()));

  injector.registerFactory<OnBoardingRepository>(
      () => OnBoardingRepository(injector()));

  injector
      .registerFactory<ProfileRepository>(() => ProfileRepository(injector()));

  injector.registerFactory<CandidatesRepository>(
      () => CandidatesRepository(injector()));
}
