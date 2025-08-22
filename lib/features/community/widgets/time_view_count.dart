import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class timeViewCount extends StatelessWidget {
  const timeViewCount({
    super.key,
    required this.timeRequired,
    required this.reviewsCount,
  });

  final int timeRequired;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          spacing: 6,
          children: [
            SvgPicture.asset(
              AppIcons.clock,
              colorFilter: ColorFilter.mode(
                AppColors.brownF9,
                BlendMode.srcIn,
              ),
            ),
            Text(
              '${timeRequired} min',
              style: AppStyles.subtextOq,
            ),
          ],
        ),
        Row(
          spacing: 5,
          children: [
            Text(
              '$reviewsCount',
              style: AppStyles.subtextOq,
            ),
            SvgPicture.asset(
              AppIcons.community,
              width: 10.w,
              height: 10.h,
            ),
          ],
        ),
      ],
    );
  }
}
