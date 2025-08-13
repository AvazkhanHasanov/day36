import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeContainer extends StatelessWidget {
  const RecipeContainer({
    super.key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        width: 207.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: backgroundColor,
        ),
        child: isLoading
            ? SizedBox(
          width: 20.w,
          height: 20.w,
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.brownF9),
          ),
        )
            : Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
