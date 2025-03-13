import 'package:e_election/data/entity/user_entity_data.dart';
import 'package:e_election/data/local/local.prefs.dart';

class LocalService {
  final LocalPrefs _localPrefs;

  LocalService(
    this._localPrefs,
  );

  Future<void> saveAppInitializedStatus(bool status) async {
    await _localPrefs.saveAppInitializedStatus(status);
  }

  Future<bool?> isAppInitialized() async {
    return await _localPrefs.isAppInitialized();
  }

  Future<void> saveUserData(UserDataEntity userDataEntity) async {
    await _localPrefs.saveUserData(userDataEntity);
  }

  Future<UserDataEntity?> getUserData() async {
    return await _localPrefs.getUserData();
  }

  Future<void> removeUserData() async {
    return await _localPrefs.removeUserData();
  }

  Future<void> saveUserLoginStatus(bool loginStatus) async {
    await _localPrefs.saveUserLoginStatus(loginStatus);
  }

  Future<bool?> getUserIsLogin() async {
    return await _localPrefs.getUserIsLogin();
  }

  void changeLanguage(String langCode) async {
    await _localPrefs.changeLanguage(langCode);
  }

  Future<String?> getEmail() async {
    return await _localPrefs.getEmail();
  }

  Future<String?> getUserToken() async {
    return await _localPrefs.getUserToken();
  }

  Future<void> saveToken(String token) async {
    await _localPrefs.saveToken(token);
  }

  Future<String?> getToken() async {
    return await _localPrefs.getToken();
  }
}
