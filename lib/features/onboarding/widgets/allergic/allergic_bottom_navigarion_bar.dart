import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class AllergicBottomNavigationBar extends StatelessWidget {
  const AllergicBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.backgroundColor, required this.foregroundColor,
  });

  final VoidCallback onTap;
  final Color backgroundColor;
  final Color foregroundColor;

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
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.center,
                  width: 162.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(30.r),
                    color: backgroundColor,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: foregroundColor,
                    ),
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
