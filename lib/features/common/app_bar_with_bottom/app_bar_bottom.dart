import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBottom({
    super.key,
    required this.text,
    this.color = AppColors.redPinkMain,
  });

  final String text;
  final Color color;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(39.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(39.h),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadiusGeometry.circular(18.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
              child: Text(text, style: AppStyles.tSW400S16),
            ),
          ),
        ],
      ),
    );
  }
}
