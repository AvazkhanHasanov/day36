import 'package:hive/hive.dart';
part 'category_model.g.dart';
@HiveType(typeId: 0)
class CategoriesModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String image;

  CategoriesModel({required this.id, required this.title, required this.image});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
