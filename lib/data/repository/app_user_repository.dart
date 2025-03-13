import 'package:e_election/data/entity/user_entity_data.dart';
import 'package:e_election/data/local/local_services.dart';
import 'package:e_election/data/repository/base_repository.dart';

class AppUserRepository extends BaseRepository {
  final LocalService _localService;

  AppUserRepository(this._localService);

  Future<void> saveAppInitializedStatus(bool status) async {
    await _localService.saveAppInitializedStatus(status);
  }

  Future<bool?> isAppInitialized() async {
    return await _localService.isAppInitialized();
  }

  void changeLanguage(String langCode) async {
    _localService.changeLanguage(langCode);
  }

  Future<void> saveUserData(UserDataEntity userDataEntity) async {
    await _localService.saveUserData(userDataEntity);
  }

  Future<UserDataEntity?> getUserData() async {
    return await _localService.getUserData();
  }

  Future<void> removeUserData() async {
    return await _localService.removeUserData();
  }

  Future<void> saveUserLoginStatus(bool loginStatus) async {
    await _localService.saveUserLoginStatus(loginStatus);
  }

  Future<bool?> getUserIsLogin() async {
    return await _localService.getUserIsLogin();
  }

  Future<void> saveToken(String token) async {
    await _localService.saveToken(token);
  }

  Future<String?> getToken() async {
    return await _localService.getToken();
  }
}
