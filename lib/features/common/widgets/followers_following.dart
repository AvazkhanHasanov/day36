import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/divider.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/profile_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowersFollowing extends StatelessWidget {
  const FollowersFollowing({
    super.key, required this.recipesCount, required this.followingCount, required this.followerCount,

  });
final int recipesCount,followingCount,followerCount;


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 50.h,
        maxHeight: 60.h,
      ),
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: AppColors.pink,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileRichText(
            number: recipesCount,
            text: 'recipes',
          ),
          divider(),
          ProfileRichText(
            number: followingCount,
            text: 'Following',
          ),
          divider(),
          ProfileRichText(
            number:followerCount,
            text: 'Followers',
          ),
        ],
      ),
    );
  }
}
