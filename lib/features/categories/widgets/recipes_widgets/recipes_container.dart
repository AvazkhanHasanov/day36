import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';

class RecipesContainer extends StatelessWidget {
  const RecipesContainer({
    super.key,
    required this.timeRequired,
    required this.rating,
    required this.title,
    required this.description,
  });

  final int timeRequired;
  final num rating;
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.bottomCenter,
        width: 158.5.w,
        height: 85.h,
        decoration: BoxDecoration(
          color: AppColors.brownF9,
          border: BoxBorder.all(
            width: 1,
            color: AppColors.pinkSubC,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14.r),
            bottomRight: Radius.circular(14.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                style: AppStyles.subText,
              ),
              Text(
                description,
                style: AppStyles.subTextMini,
                maxLines: 2,
              ),
              Row(
                spacing: 5.w,
                children: [
                  Text(
                    rating.toString(),
                    style: AppStyles.tSW400S12,
                  ),
                  RecipesIconButton(
                    icon: AppIcons.star,
                    onPressed: () {},
                  ),
                  Spacer(),
                  RecipesIconButton(
                    icon: AppIcons.clock,
                    onPressed: () {},
                  ),
                  Text(
                    '${timeRequired}min',
                    style: AppStyles.tSW400S12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
