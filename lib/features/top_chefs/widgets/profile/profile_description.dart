import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.presentation,
    required this.profilePhoto,
  });

  final String firstName, lastName, presentation, profilePhoto;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 13.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(48.5.r),
          child: Image.network(
            profilePhoto,
            width: 102.w,
            height: 97.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 210.w,
          child: Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$firstName $lastName-Chef',
                maxLines: 2,
                style: AppStyles.subtitle,
              ),
              Text(
                presentation,
                style: AppStyles.tSW300S12L,
                maxLines: 2,
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
