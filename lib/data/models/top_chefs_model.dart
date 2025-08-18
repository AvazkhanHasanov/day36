class TopChefsModel {
  final String username, firstName, lastName, profilePhoto;
  final int id;

  TopChefsModel({
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
    required this.id,
    required this.username,
  });

  factory TopChefsModel.fromJson(Map<String, dynamic> json) {
    return TopChefsModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePhoto: json['profilePhoto'],
      id: json['id'],
      username: json['username'],
    );
  }
}
