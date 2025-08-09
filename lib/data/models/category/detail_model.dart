import 'package:dio/dio.dart';

class DetailModel {
  int id, timeRequired;
  num rating;
  String title, description, photo;
  final UserModel user;
  final List<InstructionsModel> instructions;

  DetailModel({
    required this.instructions,
    required this.user,
    required this.id,
    required this.timeRequired,
    required this.rating,
    required this.title,
    required this.photo,
    required this.description,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'],
      title: json['title'],
      photo: json['photo'],
      description: json['description'],
      rating: json['rating'],
      timeRequired: json['timeRequired'],
      user: UserModel.fromJson(json['user']),
      instructions: (json['instructions'] as List)
          .map((x) => InstructionsModel.fromJson(x))
          .toList(),
    );
  }
}

class UserModel {
  int id;
  String profilePhoto, userName, firstName, lastName;

  UserModel({
    required this.id,
    required this.profilePhoto,
    required this.firstName,
    required this.lastName,
    required this.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      profilePhoto: json['profilePhoto'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['username'],
    );
  }
}

class InstructionsModel {
  String text;
  int order;

  InstructionsModel({required this.text, required this.order});

  factory InstructionsModel.fromJson(Map<String, dynamic> json) {
    return InstructionsModel(text: json['text'], order: json['order']);
  }
}
