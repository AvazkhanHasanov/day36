
import 'user_model.dart';

class CommunityRecipesModel {
  final int id;
  final String title, description, photo;
  final DateTime created;
  final int timeRequired, reviewsCount;
  final num rating;
  final UserModel user;
  CommunityRecipesModel({
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

  factory CommunityRecipesModel.fromJson(Map<String, dynamic> json) {
    return CommunityRecipesModel(
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

