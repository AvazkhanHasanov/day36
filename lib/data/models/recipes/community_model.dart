class CommunityModel {
  final String title, description, photo;
  final DateTime created;
  final int timeRequired, reviewsCount,id;
  final num rating;
  final UserModel user;
  CommunityModel({
    required this.id,
    required this.user,
    required this.title,
    required this.description,
    required this.photo,
    required this.created,
    required this.timeRequired,
    required this.reviewsCount,
    required this.rating,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      user: UserModel.fromJson(json['user']),
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      created: DateTime.parse(json['created']),
      timeRequired: json['timeRequired'],
      reviewsCount: json['reviewsCount'],
      rating: json['rating'],
    );
  }
}

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
}
