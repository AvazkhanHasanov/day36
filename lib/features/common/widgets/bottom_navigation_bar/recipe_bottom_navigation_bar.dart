import 'package:day_36_darsda1/core/routing/routes.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RecipeBottomNavigationBar extends StatefulWidget {
  const RecipeBottomNavigationBar({
    super.key,
  });

  @override
  State<RecipeBottomNavigationBar> createState() => _RecipeBottomNavigationBarState();
}

class _RecipeBottomNavigationBarState extends State<RecipeBottomNavigationBar> {
  int selectedIndex = 0;

  void _tapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Har bir index uchun alohida action
    switch (index) {
      case 0:
        context.go(Routes.home);
        break;
      case 1:
        context.go(Routes.community);
        break;
      case 2:
        context.go(Routes.categoriesPage);

        break;
      case 3:
        context.go(Routes.profile);
        break;
    }
  }

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
                colors: [Colors.transparent, Theme.of(context).colorScheme.primary],
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
                  onDestinationSelected: _tapped,
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
                      label: 'Community',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(AppIcons.categories),
                      label: 'Categories',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(AppIcons.profile),
                      label: 'Profile',
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
