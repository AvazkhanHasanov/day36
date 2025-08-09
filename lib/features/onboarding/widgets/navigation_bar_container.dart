import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationBarContainer extends StatelessWidget {
  const NavigationBarContainer({
    super.key,
    required this.text,
    required this.color, required this.onTap,
  });

  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 162.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(30.r),
          color: color,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.brownF9,
          ),
        ),
      ),
    );
  }
}
