import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/features/onboarding/widgets/navigation_bar_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreferencesBottomNavigationBar extends StatelessWidget {
  const PreferencesBottomNavigationBar({
    super.key,
    required this.onTap1,
    required this.onTap2,
  });

  final VoidCallback onTap1;
  final VoidCallback onTap2;

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavigationBarContainer(
                    text: 'Skip',
                    color: AppColors.pink,
                    onTap: onTap1,
                  ),
                  NavigationBarContainer(
                    text: 'Continue',
                    color: AppColors.redPinkMain,
                    onTap: onTap2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
