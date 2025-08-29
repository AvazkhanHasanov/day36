import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextButtonProfile extends StatelessWidget {
  const TextButtonProfile({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor=AppColors.pink,
    this.textColor=AppColors.pinkSubC
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 173.w,
      height: 27.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: AppStyles.subtitle.copyWith(color: textColor),
        ),
      ),
    );
  }
}
