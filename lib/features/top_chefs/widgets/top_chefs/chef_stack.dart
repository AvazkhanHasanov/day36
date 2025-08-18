import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/top_chefs/chef_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../common/heart_icon.dart';

class ChefStack extends StatefulWidget {
  const ChefStack({
    super.key,
    required this.photo,
    required this.firstName,
    required this.username,
    required this.id,
  });

  final String photo, firstName, username;
  final int id;

  @override
  State<ChefStack> createState() => _ChefStackState();
}

class _ChefStackState extends State<ChefStack> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 170.w,
        height: 217.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                constraints: BoxConstraints(minHeight: 76.h),
                width: 160.w,
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
                        widget.firstName,
                        style: AppStyles.subtextB,
                      ),
                      Text(
                        "@${widget.username}",
                        style: AppStyles.subtextB,
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          Text(
                            '3984',
                            style: AppStyles.subtextPink,
                          ),
                          SvgPicture.asset(AppIcons.star),
                          Spacer(),
                          ChefContainer(),
                          RecipesIconButton(
                            icon: AppIcons.share,
                            onPressed: () {},
                            size: Size(15.w, 15.h),
                            padding: EdgeInsets.all(2.r),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Image.network(
                widget.photo,
                width: 170.w,
                height: 153.h,
                fit: BoxFit.cover,
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
      ),
    );
  }
}
