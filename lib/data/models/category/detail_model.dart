class DetailModel {
  int id, timeRequired;
  num rating;
  String title, description, photo;

  DetailModel({
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
    );
  }
}
