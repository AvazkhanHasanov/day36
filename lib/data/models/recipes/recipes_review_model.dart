class RecipesReviewModel {
  final int id, reviewsCount;
  final String title, photo;
  final num rating;
  final UserDetail user;

  RecipesReviewModel({
    required this.id,
    required this.reviewsCount,
    required this.title,
    required this.photo,
    required this.rating,
    required this.user,
  });

  factory RecipesReviewModel.fromJson(Map<String, dynamic> json) {
    return RecipesReviewModel(
      id: json['id'],
      reviewsCount: json["reviewsCount"],
      title: json['title'],
      photo: json['photo'],
      rating: json['rating'],
      user: UserDetail.fromJson(json['user']),
    );
  }
}

class UserDetail {
  final int id;
  final String username, firstName, lastName, profilePhoto;

  UserDetail({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePhoto: json['profilePhoto'],
    );
  }
}
