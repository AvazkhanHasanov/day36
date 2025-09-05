import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextButtonProfile extends StatelessWidget {
  const TextButtonProfile({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.pink,
    this.textColor = AppColors.pinkSubC,
    this.width = 173,
    this.height = 27,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
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
