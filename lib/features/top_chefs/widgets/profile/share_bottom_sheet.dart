import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({
    super.key, required this.username, required this.profilePhoto,
  });
final String username,profilePhoto;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 253.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.brownF9,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Column(
        children: [
          Row(
            spacing: 15,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(31.r),
                child: Image.network(profilePhoto, width: 64.w,
                  height: 63.h,fit: BoxFit.cover,),
              ),
              Text(
                '@$username',
                style: AppStyles.subtitle,
              ),
            ],
          ),
          Text(
            'Copy Profile URL',
            style: AppStyles.tSW400S15,
          ),
          Text(
            'Share this Profile',
            style: AppStyles.tSW400S15,
          ),
        ],
      ),
    );
  }
}
