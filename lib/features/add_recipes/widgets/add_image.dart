import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddImage extends StatelessWidget {
  const AddImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 362.w,
          height: 281.h,
          decoration: BoxDecoration(
            color: AppColors.pink.withAlpha((255 / 2).toInt()),
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ],
    );
  }
}
