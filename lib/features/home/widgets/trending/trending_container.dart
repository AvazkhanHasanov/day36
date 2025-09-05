import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';

class HomeTrendingContainer extends StatelessWidget {
  HomeTrendingContainer({
    required this.timeRequired,
    super.key,
    required this.title,
    required this.description,
    required this.rating,
  });

  final String title, description;
  final num rating;
  final int timeRequired;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 65.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14.r),
          bottomRight: Radius.circular(14.r),
        ),
        border: BoxBorder.fromLTRB(
          bottom: BorderSide(
            color: AppColors.pinkSubC,
            width: 1,
          ),
          right: BorderSide(
            color: AppColors.pinkSubC,
            width: 1,
          ),
          left: BorderSide(
            color: AppColors.pinkSubC,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 250.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.subtext.copyWith(fontSize: 13.sp, color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.paragraph.copyWith(fontSize: 13.sp, color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(AppIcons.clock),
                  Text(
                    '${timeRequired}min',
                    style: AppStyles.subtextPink,
                  ),
                ],
              ),
              Row(
                spacing: 8.w,
                children: [
                  Text(
                    '$rating',
                    style: AppStyles.subtextPink,
                  ),

                  SvgPicture.asset(AppIcons.star),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
