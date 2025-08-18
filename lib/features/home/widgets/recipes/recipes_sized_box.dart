import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../common/heart_icon.dart';

class RecipesSizedBox extends StatefulWidget {
  const RecipesSizedBox({
    super.key,
    required this.photo,
    required this.title,
    required this.rating,
    required this.timeRequired,
  });

  final String photo;
  final String title;
  final num rating;
  final int timeRequired;

  @override
  State<RecipesSizedBox> createState() => _RecipesSizedBoxState();
}

class _RecipesSizedBoxState extends State<RecipesSizedBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169.w,
      height: 195.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Image.network(
              widget.photo,
              width: 169.w,
              height: 162.h,
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: BoxConstraints(minHeight: 48.h),
              width: 168.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(13.r),
                color: AppColors.brownF9,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: AppStyles.subtextB,
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Text(
                          '${widget.rating}',
                          style: AppStyles.subtextPink,
                        ),
                        SvgPicture.asset(AppIcons.star),
                        SizedBox(width: 22.w),
                        SvgPicture.asset(AppIcons.clock),
                        Text(
                          '${widget.timeRequired}min',
                          style: AppStyles.subtextPink,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 7.h,
            right: 8.w,
            child: HeartIcon(
              onPressed: () {
                isSelected = !isSelected;
                setState(() {});
              },
              backgroundColor: isSelected
                  ? AppColors.redPinkMain
                  : AppColors.pink,
              foregroundColor: isSelected
                  ? AppColors.brownF9
                  : AppColors.pinkSubC,
            ),
          ),
        ],
      ),
    );
  }
}
