class TopChefsModel {
  final int id;
  final String username, firstName, lastName, profilePhoto;


  TopChefsModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,

    required this.username,
  });

  factory TopChefsModel.fromJson(Map<String, dynamic> json) {
    return TopChefsModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePhoto: json['profilePhoto'],

      username: json['username'],
    );
  }
}
