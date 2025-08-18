import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 13.w,
      children: [
        Container(
          width: 102.w,
          height: 97.h,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(48.5.r),
          ),
        ),
        SizedBox(
          width: 210.w,
          child: Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Neil Tran-Chef',
                style: AppStyles.subtitle,
              ),
              Text(
                'Passionate chef in creative and contemporary cuisine.',
                style: AppStyles.tSW300S12L,
              ),
              Container(
                alignment: Alignment.center,
                width: 81.w,
                height: 19.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19.r),
                  color: AppColors.pink,
                ),
                child: Text(
                  'Following',
                  style: AppStyles.tSW500S10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
