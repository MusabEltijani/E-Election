class UserDataEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String picture;
  final String signature;
  final String status;
  // final String? confirmationCode;
  // final String confirmed;
  // final String isTermAccept;
  // final String ins;
  final String apiToken;
  // final String lang;
  // final String createdBy;
  // final String? updatedBy;
  // final String createdAt;
  // final String updatedAt;
  // final String? deletedAt;

  UserDataEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.picture,
    required this.signature,
    required this.status,
    // this.confirmationCode,
    // required this.confirmed,
    // required this.isTermAccept,
    // required this.ins,
    required this.apiToken,
    // required this.lang,
    // required this.createdBy,
    // this.updatedBy,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
  });

  factory UserDataEntity.fromJson(Map<String, dynamic> json) {
    return UserDataEntity(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      picture: json['picture'],
      signature: json['signature'],
      status: json['status'],
      // confirmationCode: json['confirmation_code'] ?? '',
      // confirmed: json['confirmed'],
      // isTermAccept: json['is_term_accept'],
      // ins: json['ins'],
      apiToken: json['api_token'],
      // lang: json['lang'],
      // createdBy: json['created_by'],
      // updatedBy: json['updated_by'] ?? '',
      // createdAt: json['created_at'],
      // updatedAt: json['updated_at'],
      // deletedAt: json['deleted_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'picture': picture,
      'signature': signature,
      'status': status,
      // 'confirmation_code': confirmationCode,
      // 'confirmed': confirmed,
      // 'is_term_accept': isTermAccept,
      // 'ins': ins,
      'api_token': apiToken,
      // 'lang': lang,
      // 'created_by': createdBy,
      // 'updated_by': updatedBy,
      // 'created_at': createdAt,
      // 'updated_at': updatedAt,
      // 'deleted_at': deletedAt,
    };
  }
}
