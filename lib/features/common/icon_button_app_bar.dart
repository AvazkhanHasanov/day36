import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonAppBar extends StatelessWidget {
  const IconButtonAppBar({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
  });
  final String icon;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      style: IconButton.styleFrom(
        minimumSize: Size(28.w, 28.h),
        maximumSize: Size(28.w, 28.h),
        padding: EdgeInsets.zero,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: SvgPicture.asset(
        icon,
      ),
    );
  }
}
