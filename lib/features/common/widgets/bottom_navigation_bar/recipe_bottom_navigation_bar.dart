import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 127.h,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent,AppColors.brownF9],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 34.h),
              child: Container(
                width: 280.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(33.r),
                  color: AppColors.redPinkMain,
                ),
                child: NavigationBar(
                  height: 56.h,
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  destinations: [
                    NavigationDestination(
                      icon: SvgPicture.asset(AppIcons.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(AppIcons.community),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(AppIcons.categories),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(AppIcons.profile),
                      label: 'Home',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
