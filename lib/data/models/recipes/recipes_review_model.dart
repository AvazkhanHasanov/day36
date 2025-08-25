import 'package:day_36_darsda1/data/models/recipes/user_model.dart';

class RecipesReviewModel {
  final int id;
  final int reviewsCount;
  final String title, photo;
  final num rating;
  final UserModel user;

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
      user: UserModel.fromJson(json['user']),
    );
  }
}
