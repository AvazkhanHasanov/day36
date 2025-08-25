
class RecipesCreateReviewModel {
  final int id;
  final String title, image;

  RecipesCreateReviewModel({
    required this.image,
    required this.id,
    required this.title,
  });

  factory RecipesCreateReviewModel.formJson(Map<String, dynamic> json) {
    return RecipesCreateReviewModel(
      image: json['photo'],
      id: json['id'],
      title: json['title'],
    );
  }
}
