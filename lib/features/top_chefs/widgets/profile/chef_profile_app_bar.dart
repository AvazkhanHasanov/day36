import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/share_bottom_sheet.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/three_dot_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChefProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChefProfileAppBar({
    super.key, required this.username, required this.profilePhoto,
  });

  final String username, profilePhoto;

  @override
  Size get preferredSize => Size(double.infinity, 56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: RecipesIconButton(
        icon: AppIcons.backArrow,
        onPressed: () {
          context.pop();
        },
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.redPinkMain,
        size: Size(16.w, 14.h),
      ),
      title: Text('@$username', style: AppStyles.titlle),
      actionsPadding: EdgeInsets.only(right: 37.w),
      actions: [
        Builder(
          builder: (context) {
            return RecipesIconButton(
              icon: AppIcons.share,
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return ShareBottomSheet(
                      username: username,
                      profilePhoto: profilePhoto,
                    );
                  },
                );
              },
              size: Size(28, 28),
              backgroundColor: AppColors.pink,
              foregroundColor: AppColors.pinkSubC,
            );
          },
        ),
        SizedBox(width: 5.w),
        RecipesIconButton(
          icon: AppIcons.threeDots,
          size: Size(28, 28),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ThreeDotBottomSheet(
                  username: username,
                  profilePhoto: profilePhoto,
                );
              },
            );
          },
          backgroundColor: AppColors.pink,
          foregroundColor: AppColors.pinkSubC,
        ),
      ],
    );
  }
}
