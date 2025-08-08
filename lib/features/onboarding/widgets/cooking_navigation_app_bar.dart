import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CookingNavigationAppBar extends StatelessWidget {
  const CookingNavigationAppBar({
    super.key,
  });

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
              child: Container(
                alignment: Alignment.center,
                width: 207.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(30.r),
                  color: AppColors.redPinkMain,
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.brownF9,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
