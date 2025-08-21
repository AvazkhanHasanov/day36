import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameImage extends StatelessWidget {
  const NameImage({
    super.key,
    required this.username,
    required this.firstName,
    required this.image,
  });

  final String username, firstName, image;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing:5.w ,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: Image.network(
            image,
            width: 32.w,
            height: 33.h,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@$username',
              style: AppStyles.tSW400S13Oq,
            ),
            Text(
              '$firstName-Chef',
              style: AppStyles.tSW400S13Oq,
            ),
          ],
        ),
      ],
    );
  }
}
