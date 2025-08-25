class RecipesModel {
  final int id;
  final int categoryId, timeRequired;
  final num rating;
  final String title, description, photo;

  RecipesModel({
    required this.id,
    required this.categoryId,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.title,
    required this.description,
  });

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
      id: json['id'],
      categoryId: json['categoryId'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
    );
  }
}
