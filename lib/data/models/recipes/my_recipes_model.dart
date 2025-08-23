class MyRecipesModel {
  final int id, categoryId, timeRequired;
  final num rating;
  final String title, description, photo, difficulty;

  MyRecipesModel({
    required this.id,
    required this.categoryId,
    required this.timeRequired,
    required this.rating,
    required this.title,
    required this.description,
    required this.photo,
    required this.difficulty,
  });

  factory MyRecipesModel.fromJson(Map<String, dynamic> json) {
    return MyRecipesModel(
      id: json['id'],
      categoryId: json['categoryId'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      difficulty: json['difficulty'],
    );
  }
}
