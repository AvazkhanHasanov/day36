import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateReviewSizedBox extends StatelessWidget {
  const CreateReviewSizedBox({
    super.key, required this.text, required this.photo,
  });
final String text, photo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 356.w,
      height: 262.h,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: 356.w,
            height: 262.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.redPinkMain,
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Text(
                text,
                style: AppStyles.tSW500S20Oq,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                photo,
                width: 356.w,
                height: 206.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
