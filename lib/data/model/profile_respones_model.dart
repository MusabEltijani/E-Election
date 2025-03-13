class ProfileResponseModel {
  final ProfileData data;
  final String message;
  final int status;

  ProfileResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      data: ProfileData.fromJson(json['data'] ?? {}),
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'message': message,
      'status': status,
    };
  }
}

class ProfileData {
  final String firstName;
  final String middleName;
  final String familyName;
  final String lastName;
  final String phoneNumber;
  final String birthDay;
  final int idNumber;
  final String passportNumber;
  final StateInfo? state;
  final PartyInfo? party;
  final String avatar;

  ProfileData({
    required this.firstName,
    required this.middleName,
    required this.familyName,
    required this.lastName,
    required this.phoneNumber,
    required this.birthDay,
    required this.idNumber,
    required this.passportNumber,
    this.state,
    this.party,
    required this.avatar,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      firstName: json['first_name'] ?? '',
      middleName: json['middle_name'] ?? '',
      familyName: json['family_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      birthDay: json['birth_day'] ?? '',
      idNumber: json['id_number'] ?? 0,
      passportNumber: json['passport_number'] ?? '',
      state: json['state'] != null ? StateInfo.fromJson(json['state']) : null,
      party: json['party'] != null ? PartyInfo.fromJson(json['party']) : null,
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'middle_name': middleName,
      'family_name': familyName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'birth_day': birthDay,
      'id_number': idNumber,
      'passport_number': passportNumber,
      'state': state?.toJson(),
      'party': party?.toJson(),
      'avatar': avatar,
    };
  }
}

class StateInfo {
  final String name;

  StateInfo({required this.name});

  factory StateInfo.fromJson(Map<String, dynamic> json) {
    return StateInfo(
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

class PartyInfo {
  final String name;

  PartyInfo({required this.name});

  factory PartyInfo.fromJson(Map<String, dynamic> json) {
    return PartyInfo(
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
