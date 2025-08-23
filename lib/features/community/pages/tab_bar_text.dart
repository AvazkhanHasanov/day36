import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarText extends StatelessWidget {
  const TabBarText({
    super.key,
    required this.text, required this.isSelected,
  });
final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 119.w,
      height: 25.h,
      decoration: BoxDecoration(
        color: isSelected?AppColors.redPinkMain:Colors.transparent,
        borderRadius: BorderRadius.circular(12.5.r),
      ),
      child: Text(
        text,
        style:isSelected? AppStyles.tSW400S15Oq:AppStyles.tSW400S15Red,
      ),
    );
  }
}
