class CategoriesModel {
  final String title, image;
  final int id;

  CategoriesModel({required this.title, required this.image, required this.id});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      title: json['title'],
      image: json['image'],
      id: json['id'],
    );
  }
}