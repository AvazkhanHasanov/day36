class UserModel {
  final int id;
  final String profilePhoto, username, firstName, lastName;

  UserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toJson()
  {
  return {
  'id':id,
  'profilePhoto':profilePhoto,
  'username':username,
  'firstName':firstName,
  'lastName':lastName,
  };
}}
