import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/divider.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/profile_rich_text.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/profile_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChefProfile extends StatelessWidget {
  const ChefProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: RecipesIconButton(
          icon: AppIcons.backArrow,
          onPressed: () {},
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.redPinkMain,
          size: Size(16.w, 14.h),
        ),
        title: Text('@neil_tran', style: AppStyles.titlle),
        actionsPadding: EdgeInsets.only(right: 37.w),
        actions: [
          RecipesIconButton(
            icon: AppIcons.share,
            onPressed: () {},
            size: Size(28, 28),
            backgroundColor: AppColors.pink,
            foregroundColor: AppColors.pinkSubC,
          ),
          SizedBox(width: 5.w),
          RecipesIconButton(
            icon: AppIcons.threeDots,
            size: Size(28, 28),
            onPressed: () {},
            backgroundColor: AppColors.pink,
            foregroundColor: AppColors.pinkSubC,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w),
          child: Column(
            spacing: 12.h,
            children: [
              ProfileDescription(),
              Container(
                constraints: BoxConstraints(minHeight: 50.h, maxHeight: 60.h),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: AppColors.pink, width: 1),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileRichText(
                      number: 14,
                      text: 'recipes',
                    ),
                    divider(),
                    ProfileRichText(
                      number: 10,
                      text: 'Following',
                    ),
                    divider(),

                    ProfileRichText(
                      number: 255770,
                      text: 'Followers',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
