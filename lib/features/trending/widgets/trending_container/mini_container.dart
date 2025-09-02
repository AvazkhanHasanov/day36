import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/icons.dart';

class MiniContainer extends StatelessWidget {
  const MiniContainer({
    required this.title,
    required this.description,
    required this.rating,
    required this.timeRequired,
    super.key,
  });

  final String title, description;
  final int timeRequired;
 final  num rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.w,
      constraints: BoxConstraints(
        minHeight: 49.h,
        maxHeight: 59.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.only(
          bottomLeft: Radius.circular(
            14,
          ),
          bottomRight: Radius.circular(
            14,
          ),
        ),
        color: AppColors.brownF9,
        border: BoxBorder.all(
          width: 1,
          color: AppColors.pinkSubC,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
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
                    style: AppStyles.tSW400S13Oq.copyWith(color: AppColors.beige),
                    maxLines: 1,
                  ),
                  Text(
                    description,
                    style: AppStyles.subTextMini,
                    maxLines: 1,
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
      ),
    );
  }
}
