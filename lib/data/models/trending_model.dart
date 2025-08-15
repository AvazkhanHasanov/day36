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
      id: json['id']as int,
      categoryId: json['categoryId']as int,
      title: json['title']as String,
      description: json['description']as String,
      difficulty: json['difficulty']as String,
      photo: json['photo']as String,
      timeRequired: json['timeRequired']as int,
      rating: (json['rating']as num),
    );
  }
}