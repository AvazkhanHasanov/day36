import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StackContainer extends StatelessWidget {
  const StackContainer({
    super.key,
    required this.title,
    required this.description,
    required this.timeRequired,
    required this.rating,
  });

  final String title;
  final String description;
  final int timeRequired;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207.w,
      height: 122.h,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.brownF9,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            14.r,
          ),
          bottomRight: Radius.circular(14.r),
        ),
        border: BoxBorder.fromLTRB(
          top: BorderSide(
            color: AppColors.pink,
            width: 1.w,
          ),
          right: BorderSide(
            color: AppColors.pink,
            width: 1.w,
          ),
          bottom: BorderSide(
            color: AppColors.pink,
            width: 1.w,
          ),
        ),
      ),
      child: Column(
        spacing: 5.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.subText,
          ),
          Text(
            description,
            style: AppStyles.subTextMini,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text('By Chef Josh Ryan', style: AppStyles.tSW300S12),
          Row(
            spacing: 3.w,
            children: [
              SvgPicture.asset(AppIcons.clock),
              SizedBox(width: 3.w),
              Text(
                '${timeRequired}min',
                style: AppStyles.subtextPink,
              ),
              Spacer(),
              Text('Easy', style: AppStyles.subtextPink),
              SvgPicture.asset(AppIcons.progress),
              Spacer(),
              Text(
                '$rating',
                style: AppStyles.subtextPink,
              ),
              SvgPicture.asset(AppIcons.star),
            ],
          ),
        ],
      ),
    );
  }
}
