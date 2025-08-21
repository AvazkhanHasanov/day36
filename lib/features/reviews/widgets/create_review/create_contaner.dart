import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateContainer extends StatelessWidget {
  const CreateContainer({
    super.key,
    required this.onTap,
    this.backgroundColor = AppColors.pink,
    required this.textStyle,
    required this.text,
    this.width=168,
    this.height=29
  });

  final VoidCallback onTap;
  final Color backgroundColor;
  final TextStyle textStyle;
  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color: backgroundColor,
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
