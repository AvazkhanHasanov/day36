import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/reviews/widgets/reviews/about_row.dart';
import 'package:day_36_darsda1/features/reviews/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutDetail extends StatelessWidget {
  const AboutDetail({
    super.key,
    required this.title,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.rating,
    required this.reviewsCount,
  });

  final String title, profilePhoto, username, firstName;
  final num rating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.tSW500S20Oq,
        ),
        Row(
          children: [
            StarRating(rating: rating),
            Text(
              '($reviewsCount Reviews)',
              style: AppStyles.tSW400S11Oq,
            ),
          ],
        ),
        NameImage(
          username: username,
          firstName: firstName,
          image: profilePhoto,
        ),
        Container(
          alignment: Alignment.center,
          width: 126.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: AppColors.brownF9,
            borderRadius: BorderRadiusGeometry.circular(30),
          ),
          child: Text(
            'Add Review',
            style: AppStyles.subtitle,
          ),
        ),
      ],
    );
  }
}
