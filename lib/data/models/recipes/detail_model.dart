import 'user_model.dart';

class RecipesDetailModel {
  final int id;
  final int timeRequired;
  final num rating;
  final String title, description, photo;
  final UserModel user;
  final List<InstructionsModel> instructions;
  final List<IngredientsModel> ingredients;

  RecipesDetailModel({
    required this.id,
    required this.ingredients,
    required this.instructions,
    required this.user,
    required this.timeRequired,
    required this.rating,
    required this.title,
    required this.photo,
    required this.description,
  });

  factory RecipesDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipesDetailModel(
      id: json['id'],
      ingredients: (json['ingredients'] as List).map((x) => IngredientsModel.fromJson(x)).toList(),
      title: json['title'],
      photo: json['photo'],
      description: json['description'],
      rating: json['rating'],
      timeRequired: json['timeRequired'],
      user: UserModel.fromJson(json['user']),
      instructions: (json['instructions'] as List).map((x) => InstructionsModel.fromJson(x)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ingredients': ingredients.map((x) => x.toJson()).toList(),
      'instructions': instructions.map((x) => x.toJson()).toList(),
      'user': user.toJson(),
      'timeRequired': timeRequired,
      'rating': rating,
      'title': title,
      'photo': photo,
      'description': description,
    };
  }
}

// instructiondan malumotlarni oladi
class InstructionsModel {
  final String text;
  final int order;

  InstructionsModel({
    required this.text,
    required this.order,
  });

  factory InstructionsModel.fromJson(Map<String, dynamic> json) {
    return InstructionsModel(
      text: json['text'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'order': order,
    };
  }
}

class IngredientsModel {
  final String amount, name;
  final int order;

  IngredientsModel({
    required this.amount,
    required this.name,
    required this.order,
  });

  factory IngredientsModel.fromJson(Map<String, dynamic> json) {
    return IngredientsModel(
      amount: json['amount'],
      name: json["name"],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'name': name,
      'order': order,
    };
  }
}
