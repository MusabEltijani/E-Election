import 'package:e_election/data/entity/user_entity_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPrefs {
  late final SharedPreferences preferences;

  LocalPrefs() {
    _intiSharedPreferences();
  }

  final String _keyAppInitialized = "appInitialized";
  final String _keySelectLanguage = "selectLanguage";
  final String _keyUserLogin = "userLogin";
  final String _keyId = "id";
  final String _keyFristName = "first_name";
  final String _keyLastName = "last_name";
  final String _keyEmail = "email";
  final String _keyPicture = "picture";
  final String _keySignature = "signature";
  final String _keyStatus = "status";
  // final String _keyConfirmationCode = "confirmation_code";
  // final String _keyConfirmed = "confirmed";
  // final String _keyIsTermAccept = "is_term_accept";
  // final String _keyIns = "ins";
  final String _keyApiToken = "api_token";
  // final String _keyLang = "lang";
  // final String _keyCreatedBy = "created_by";
  // final String _keyUpdatedBy = "updated_by";
  // final String _keyCreatedAt = "created_at";
  // final String _keyUpdatedAt = "updated_at";
  // final String _keyDeletedAt = "deleted_at";

  Future<void> _intiSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveAppInitializedStatus(bool status) async {
    preferences.setBool(_keyAppInitialized, status);
  }

  Future<bool> isAppInitialized() async {
    bool? isAppInitialized = preferences.getBool(_keyAppInitialized);
    if (isAppInitialized == null) {
      return false;
    } else {
      return isAppInitialized;
    }
  }

  Future<void> saveUserData(UserDataEntity userData) async {
    try {
      preferences.setInt(_keyId, userData.id);
      preferences.setString(_keyFristName, userData.firstName);
      preferences.setString(_keyLastName, userData.lastName);
      preferences.setString(_keyEmail, userData.email);
      preferences.setString(_keyApiToken, userData.apiToken);
      preferences.setString(_keyPicture, userData.picture);
      preferences.setString(_keySignature, userData.signature);
      preferences.setString(_keyStatus, userData.status);
      // preferences.setString(_keyConfirmationCode, userData.confirmationCode!);
      // preferences.setString(_keyConfirmed, userData.confirmed);
      // preferences.setString(_keyIsTermAccept, userData.isTermAccept);
      // preferences.setString(_keyIns, userData.ins);
      // preferences.setString(_keyLang, userData.lang);
      // preferences.setString(_keyCreatedAt, userData.createdAt);
      // preferences.setString(_keyCreatedBy, userData.createdBy);
      // preferences.setString(_keyUpdatedAt, userData.updatedAt);
      // preferences.setString(_keyUpdatedBy, userData.updatedBy!);
      // preferences.setString(_keyDeletedAt, userData.deletedAt!);
    } catch (e) {}
  }

  Future<void> removeUserData() async {}

  Future<void> saveUserLoginStatus(bool loginStatus) async {
    preferences.setBool(_keyUserLogin, loginStatus);
  }

  Future<bool> getUserIsLogin() async {
    bool? userIsLogin = preferences.getBool(_keyUserLogin);
    if (userIsLogin == null) {
      return false;
    } else {
      debugPrint('___________________________ > $userIsLogin');
      return userIsLogin;
    }
  }

  Future<UserDataEntity?> getUserData() async {
    int? userId = preferences.getInt(_keyId);
    String? fristName = preferences.getString(_keyFristName);
    String? lastName = preferences.getString(_keyLastName);
    String? email = preferences.getString(_keyEmail);
    String? token = preferences.getString(_keyApiToken);
    String? picture = preferences.getString(_keyPicture);
    String? signature = preferences.getString(_keySignature);
    String? status = preferences.getString(_keyStatus);
    // String? confirmationCode = preferences.getString(_keyConfirmationCode);
    // String? confirmed = preferences.getString(_keyConfirmed);
    // String? isTermAccept = preferences.getString(_keyIsTermAccept);
    // String? ins = preferences.getString(_keyIns);
    // String? lang = preferences.getString(_keyLang);
    // String? createdAt = preferences.getString(_keyCreatedAt);
    // String? createdBy = preferences.getString(_keyCreatedBy);
    // String? updatedAt = preferences.getString(_keyUpdatedAt);
    // String? updatedBy = preferences.getString(_keyUpdatedBy);
    // String? deletedAt = preferences.getString(_keyDeletedAt);

    if (userId == null &&
        fristName == null &&
        lastName == null &&
        email == null &&
        token == null &&
        picture == null &&
        signature == null &&
        status == null) {
      return null;
    } else {
      return UserDataEntity(
        id: userId!,
        firstName: fristName!,
        lastName: lastName!,
        email: email!,
        apiToken: token!,
        picture: picture!,
        signature: signature!,
        status: status!,
        // confirmed: confirmed!,
        // confirmationCode: confirmationCode!,
        // isTermAccept: isTermAccept!,
        // ins: ins!,
        // lang: lang!,
        // createdAt: createdAt!,
        // createdBy: createdBy!,
        // updatedAt: updatedAt!,
        // updatedBy: updatedBy!,
        // deletedAt: deletedAt
      );
    }
  }

  Future<void> changeLanguage(String langCode) async {
    preferences.setString(_keySelectLanguage, langCode);
  }

  Future<String> getSelectedLanguage() async {
    dynamic selectedLang = preferences.getString(_keySelectLanguage);
    if (selectedLang == null) {
      return "";
    } else {
      return selectedLang;
    }
  }

  Future<String> getEmail() async {
    dynamic phoneNumber = preferences.getString(_keyEmail);
    if (phoneNumber == null) {
      return "";
    } else {
      return phoneNumber;
    }
  }

  Future<String> getUserToken() async {
    dynamic userToken = preferences.getString(_keyApiToken);
    if (userToken == null) {
      return "";
    } else {
      return userToken;
    }
  }

  Future<void> saveToken(String token) async {
    preferences.setString(_keyApiToken, token);
  }

  Future<String> getToken() async {
    dynamic token = preferences.getString(_keyApiToken);
    if (token == null) {
      return "";
    } else {
      return token;
    }
  }
}
