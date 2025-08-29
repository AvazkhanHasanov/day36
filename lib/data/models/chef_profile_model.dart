class ChefProfileModel {
  final int id;
  final String profilePhoto, username, firstName, lastName, presentation;
   final int recipesCount, followingCount, followerCount;

  ChefProfileModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory ChefProfileModel.fromJson(Map<String, dynamic> json) {
    return ChefProfileModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      presentation: json['presentation'],

      recipesCount: json['recipesCount'],
      followingCount: json['followingCount'],
      followerCount: json['followerCount'],
    );
  }
}
