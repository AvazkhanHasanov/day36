
class DetailModel {
  int id, timeRequired;
  num rating;
  String title, description, photo;
  final UserModel user;
  final List<InstructionsModel> instructions;
  final List<IngredientsModel> ingredients;

  DetailModel({
    required this.ingredients,
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
      ingredients: (json['ingredients'] as List).map((x) =>
          IngredientsModel.fromJson(x)).toList(),
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

// Userni malumotlarini oladi
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

// instructiondan malumotlarni oladi
class InstructionsModel {
  String text;
  int order;

  InstructionsModel({required this.text, required this.order});

  factory InstructionsModel.fromJson(Map<String, dynamic> json) {
    return InstructionsModel(text: json['text'], order: json['order']);
  }
}

class IngredientsModel {
  String amount, name;
  int order;

  IngredientsModel(
      {required this.amount, required this.name, required this.order});

  factory IngredientsModel.fromJson(Map<String, dynamic> json){
    return IngredientsModel(
        amount: json['amount'], name: json["name"], order: json['order']);
  }
}
