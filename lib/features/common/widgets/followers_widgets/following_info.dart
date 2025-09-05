import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/common/widgets/followers_widgets/name_and_user_name.dart';
import 'package:day_36_darsda1/features/common/widgets/followers_widgets/profile_photo.dart';
import 'package:day_36_darsda1/features/profile/widgets/text_button_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowingInfo extends StatelessWidget {
  const FollowingInfo({
    super.key,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  final String profilePhoto;
  final String username, firstName, lastName;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        ProfilePhoto(profilePhoto: profilePhoto),
        NameAndUserName(
          username: username,
          firstName: firstName,
          lastName: lastName,
        ),
        Row(
          spacing: 9.w,
          children: [
            TextButtonProfile(
              text: 'following',
              onPressed: () {},
              width: 109,
            ),
            RecipesIconButton(
              icon: AppIcons.threeDots,
              onPressed: () {},
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.redPinkMain,
              size: Size(20.r, 20.r),
            ),
          ],
        ),
      ],
    );
  }
}
