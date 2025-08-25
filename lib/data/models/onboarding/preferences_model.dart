class PreferenceModel {
  final int id;
  final String title, image;

  PreferenceModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory PreferenceModel.fromJson(Map<String, dynamic> json) {
    return PreferenceModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
