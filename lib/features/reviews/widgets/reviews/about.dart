import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/features/reviews/widgets/reviews/about_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class About extends StatelessWidget {
  const About({
    super.key,
    required this.title,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.photo,
    required this.rating,
    required this.reviewsCount,
  });

  final String title, profilePhoto, username, firstName, photo;
  final num rating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 223.h,
          decoration: BoxDecoration(
            color: AppColors.redPinkMain,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        Row(
          spacing: 15.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                photo,
                width: 162.w,
                height: 163.h,
              ),
            ),
            AboutDetail(
              title: title,
              profilePhoto: profilePhoto,
              username: username,
              firstName: firstName,
              rating: rating,
              reviewsCount: reviewsCount,
            ),
          ],
        ),
      ],
    );
  }
}
