class CandidatesResponseModel {
  final List<Candidate> data;
  final String message;
  final int status;

  CandidatesResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory CandidatesResponseModel.fromJson(Map<String, dynamic> json) {
    return CandidatesResponseModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      message: json['message']?.toString() ?? '',
      status: json['status'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
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
      id: json['id'] as int? ?? 0,
      election: Election.fromJson(json['election'] as Map<String, dynamic>),
      citizen: Citizen.fromJson(json['citizen'] as Map<String, dynamic>),
      logo: json['logo']?.toString() ?? '',
      slogan: json['slogan']?.toString() ?? '',
      details: json['details']?.toString() ?? '',
      wikipediaUrl: json['wikipedia_url']?.toString() ?? '',
      facebookUrl: json['facebook_url']?.toString() ?? '',
      xUrl: json['x_url']?.toString() ?? '',
      youtubeUrl: json['youtube_url']?.toString() ?? '',
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
      year: json['year']?.toString() ?? '',
      startedAt: json['started_at']?.toString() ?? '',
      endedAt: json['ended_at']?.toString() ?? '',
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
  final Party? party;
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
    this.syndicate,
    this.party,
    required this.avatar,
  });

  factory Citizen.fromJson(Map<String, dynamic> json) {
    return Citizen(
      firstName: json['first_name']?.toString() ?? '',
      middleName: json['middle_name']?.toString() ?? '',
      familyName: json['family_name']?.toString() ?? '',
      lastName: json['last_name']?.toString() ?? '',
      phoneNumber: json['phone_number']?.toString() ?? '',
      birthDay: json['birth_day']?.toString() ?? '',
      idNumber: json['id_number'] as int? ?? 0,
      passportNumber: json['passport_number']?.toString() ?? '',
      state: StateModel.fromJson(json['state'] as Map<String, dynamic>),
      syndicate: json['syndicate'] != null
          ? Syndicate.fromJson(json['syndicate'] as Map<String, dynamic>)
          : null,
      party: json['party'] != null
          ? Party.fromJson(json['party'] as Map<String, dynamic>)
          : null,
      avatar: json['avatar']?.toString() ?? '',
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
      'party': party?.toJson(),
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
