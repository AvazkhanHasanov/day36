class AuthModel {
  final String firstName, lastName, email, phoneNumber, birthDate, password, username;

  AuthModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "birthDate": birthDate,
      "password": password,
      'username': username,
    };
  }
}
