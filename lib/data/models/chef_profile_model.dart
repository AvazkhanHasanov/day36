class ChefProfileModel {
  final String profilePhoto, username, firstName, lastName, presentation;
  final int id, recipesCount, followingCount, followerCount;

  ChefProfileModel({
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
    required this.id,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory ChefProfileModel.fromJson(Map<String, dynamic> json) {
    return ChefProfileModel(
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      presentation: json['presentation'],
      id: json['id'],
      recipesCount: json['recipesCount'],
      followingCount: json['followingCount'],
      followerCount: json['followerCount'],
    );
  }
}
