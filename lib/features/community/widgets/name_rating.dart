import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NameRating extends StatelessWidget {
  const NameRating({
    super.key, required this.title, required this.rating,
  });
final String title;
final num rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        Text(
          'Chicken Curry ',
          style: AppStyles.subtitleOq,
        ),
        SizedBox(width: 5.w),
        SvgPicture.asset(AppIcons.starFilled),
        Text(
          '5',
          style: AppStyles.subtitleOq,
        ),
      ],
    );
  }
}
