import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFavorites extends StatelessWidget {
  const ProfileFavorites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 15.h),
            itemCount: 4,
            itemBuilder: (context, index) => SizedBox(
              width: 430.w,
              height: 133.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 340.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: AppColors.brownF9,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        border: BoxBorder.all(width: 1, color: AppColors.pinkSubC),
                      ),
                      child: Text(
                        'sweet',
                        style: AppStyles.subtext.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/img.png',
                        width: 360.w,
                        height: 103.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
