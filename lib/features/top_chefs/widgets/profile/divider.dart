import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class divider extends StatelessWidget {
  const divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.h,
      child: VerticalDivider(
        color: AppColors.pink,
        width: 26.w,
      ),
    );
  }
}
