class CategoriesModel {
  final int id;
  final String title, image;

  CategoriesModel({required this.id, required this.title, required this.image});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
