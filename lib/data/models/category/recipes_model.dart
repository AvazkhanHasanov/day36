class RecipesModel {
  final int categoryId, timeRequired;
  final double rating;
  final String title, description, photo;

  RecipesModel( {
    required this.categoryId,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.title,
    required this.description,
  });

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
      categoryId: json['categoryId'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
    );
  }
}