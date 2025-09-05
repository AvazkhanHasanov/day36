import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextColumn extends StatelessWidget {
  const TextColumn({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 356.w,
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.tSW600S20Oq,
          ),
          Text(
            subtitle,

            style: AppStyles.tSW400S13Oq,
          ),
        ],
      ),
    );
  }
}
