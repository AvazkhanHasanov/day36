import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/features/common/widgets/recipe_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CookingNavigationAppBar extends StatelessWidget {
  const CookingNavigationAppBar({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(33.r),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, AppColors.beige],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 34.h),
              child: RecipeContainer(
                text: 'Continue',
                onTap: onTap,
                backgroundColor: AppColors.redPinkMain,
                foregroundColor: AppColors.brownF9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
