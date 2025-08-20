import 'package:day_36_darsda1/core/route/route_name.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DetailPageStack extends StatelessWidget {
  const DetailPageStack({
    super.key,
    required this.photo,
    required this.title,
    required this.rating,
  });

  final String photo, title;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 357.w,
      height: 337.h,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 16.h),
            alignment: Alignment.bottomCenter,
            width: 357.w,
            height: 337.h,
            decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16.r),
                right: Radius.circular(16.r),
              ),
            ),
            child: Row(
              spacing: 5.w,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    title,
                    style: AppStyles.tSW500S20Oq,
                    maxLines: 1,
                  ),
                ),
                Spacer(),

                GestureDetector(
                    onTap: () => context.push(RouteName.reviews),
                    child: Row(
                      spacing: 5.w,
                      children: [
                        RecipesIconButton(
                          icon: AppIcons.star,
                          onPressed: () {},
                          backgroundColor: Colors.transparent,
                          foregroundColor: AppColors.brownF9,
                        ),
                        Text('$rating', style: AppStyles.subtextOq),
                          SizedBox(width: 8.w),
                        RecipesIconButton(
                          icon: AppIcons.community,
                          onPressed: () {},
                          foregroundColor: AppColors.brownF9,
                          backgroundColor: Colors.transparent,
                        ),
                        Text('2.273',style: AppStyles.subtextOq,),
                      ],
                    ),
                  ),


              ],
            ),
          ),
          SizedBox(
            width: 357.w,
            height: 281.h,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10.r),
                  child: Image.network(
                    photo,
                    width: 357.w,
                    height: 281.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.redPinkMain,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(30),
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: Size(74.w, 71.h),
                    ),
                    icon: SvgPicture.asset(
                      AppIcons.play,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
