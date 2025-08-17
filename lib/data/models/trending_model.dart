class TrendingModel {
  int id, categoryId, timeRequired;
  String title, description, difficulty, photo;
  num rating;

  TrendingModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      difficulty: json['difficulty'],
      photo: json['photo'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
    );
  }
}