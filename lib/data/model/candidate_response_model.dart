class CandidateResponseModel {
  final Candidate data;
  final String message;
  final int status;

  CandidateResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory CandidateResponseModel.fromJson(Map<String, dynamic> json) {
    return CandidateResponseModel(
      data: Candidate.fromJson(json['data']),
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

class Candidate {
  final int id;
  final Election election;
  final Citizen citizen;
  final String logo;
  final String slogan;
  final String details;
  final String wikipediaUrl;
  final String facebookUrl;
  final String xUrl;
  final String youtubeUrl;

  Candidate({
    required this.id,
    required this.election,
    required this.citizen,
    required this.logo,
    required this.slogan,
    required this.details,
    required this.wikipediaUrl,
    required this.facebookUrl,
    required this.xUrl,
    required this.youtubeUrl,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json['id'] ?? 0,
      election: Election.fromJson(json['election']),
      citizen: Citizen.fromJson(json['citizen']),
      logo: json['logo'] ?? '',
      slogan: json['slogan'] ?? '',
      details: json['details'] ?? '',
      wikipediaUrl: json['wikipedia_url'] ?? '',
      facebookUrl: json['facebook_url'] ?? '',
      xUrl: json['x_url'] ?? '',
      youtubeUrl: json['youtube_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'election': election.toJson(),
      'citizen': citizen.toJson(),
      'logo': logo,
      'slogan': slogan,
      'details': details,
      'wikipedia_url': wikipediaUrl,
      'facebook_url': facebookUrl,
      'x_url': xUrl,
      'youtube_url': youtubeUrl,
    };
  }
}

class Election {
  final String year;
  final String startedAt;
  final String endedAt;

  Election({
    required this.year,
    required this.startedAt,
    required this.endedAt,
  });

  factory Election.fromJson(Map<String, dynamic> json) {
    return Election(
      year: json['year'] ?? '',
      startedAt: json['started_at'] ?? '',
      endedAt: json['ended_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'started_at': startedAt,
      'ended_at': endedAt,
    };
  }
}

class Citizen {
  final String firstName;
  final String middleName;
  final String familyName;
  final String lastName;
  final String phoneNumber;
  final String birthDay;
  final int idNumber;
  final String passportNumber;
  final StateModel state;
  final Syndicate? syndicate;
  final Party party;
  final String avatar;

  Citizen({
    required this.firstName,
    required this.middleName,
    required this.familyName,
    required this.lastName,
    required this.phoneNumber,
    required this.birthDay,
    required this.idNumber,
    required this.passportNumber,
    required this.state,
    required this.syndicate,
    required this.party,
    required this.avatar,
  });

  factory Citizen.fromJson(Map<String, dynamic> json) {
    return Citizen(
      firstName: json['first_name'] ?? '',
      middleName: json['middle_name'] ?? '',
      familyName: json['family_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      birthDay: json['birth_day'] ?? '',
      idNumber: json['id_number'] ?? 0,
      passportNumber: json['passport_number'] ?? '',
      state: StateModel.fromJson(json['state']),
      syndicate: json['syndicate'] != null
          ? Syndicate.fromJson(json['syndicate'])
          : null,
      party: Party.fromJson(json['party']),
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
      'state': state.toJson(),
      'syndicate': syndicate?.toJson(),
      'party': party.toJson(),
      'avatar': avatar,
    };
  }
}

class StateModel {
  final String name;

  StateModel({required this.name});

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}

class Syndicate {
  final String name;

  Syndicate({required this.name});

  factory Syndicate.fromJson(Map<String, dynamic> json) {
    return Syndicate(name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}

class Party {
  final String name;

  Party({required this.name});

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
