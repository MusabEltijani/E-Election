import 'package:e_election/data/entity/user_entity_data.dart';
import 'package:e_election/data/repository/app_user_repository.dart';
import 'package:logger/logger.dart';

class AppUserService {
  final AppUserRepository _appUserRepository;

  AppUserService(this._appUserRepository);

  Logger logger = Logger(
    // Customize the printer
    printer: PrettyPrinter(
      methodCount: 0,
      printTime: false,
    ),
  );

  Future<void> saveAppInitializedStatus(bool status) async {
    await _appUserRepository.saveAppInitializedStatus(status);
  }

  Future<bool?> isAppInitialized() async {
    return await _appUserRepository.isAppInitialized();
  }

  void changeLanguage(langCode) {
    _appUserRepository.changeLanguage(langCode);
  }

  Future<void> saveUserData(UserDataEntity userDataEntity) async {
    await _appUserRepository.saveUserData(userDataEntity);
  }

  Future<void> saveToken(String token) async {
    await _appUserRepository.saveToken(token);
  }

  Future<String?> getToken() async {
    return await _appUserRepository.getToken();
  }

  Future<UserDataEntity?> getUserData() async {
    return await _appUserRepository.getUserData();
  }

  Future<void> removeUserData() async {
    return await _appUserRepository.removeUserData();
  }

  Future<void> saveUserLoginStatus(bool userLoginStatus) async {
    await _appUserRepository.saveUserLoginStatus(userLoginStatus);
  }

  Future<bool?> userIsLogin() async {
    return await _appUserRepository.getUserIsLogin();
  }
}
