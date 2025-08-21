
class CreateReviewModel {
  final int id;
  final String comment, image;

  CreateReviewModel({
    required this.image,
    required this.id,
    required this.comment,
  });

  factory CreateReviewModel.formJson(Map<String, dynamic> json) {
    return CreateReviewModel(
      image: json['photo'],
      id: json['id'],
      comment: json['title'],
    );
  }
}
