import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    required this.rating,
    this.spacing = 5,
    this.filledColor = AppColors.brownF9,
    this.emptyColor = AppColors.brownF9,
    this.starSize=11
  });
final double starSize;
  final Color filledColor, emptyColor;
  final num rating;

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing.w,
      children: [
        ...List.generate(
          rating.round(),
          (index) {
            return SvgPicture.asset(
              AppIcons.star,width: starSize.w,height: starSize.h,
              colorFilter: ColorFilter.mode(
                emptyColor,
                BlendMode.srcIn,
              ),
            );
          },
        ),
        ...List.generate(
          5 - rating.round(),
          (index) {
            return SvgPicture.asset(
              AppIcons.starEmpty,width: starSize.w,height: starSize.h,
              colorFilter: ColorFilter.mode(
                filledColor,
                BlendMode.srcIn,
              ),
            );
          },
        ),
      ],
    );
  }
}
