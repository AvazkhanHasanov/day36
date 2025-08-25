import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';

class AppBarBottom extends StatelessWidget {
  const AppBarBottom({
    super.key,
    required this.text,
    required this.selectedIndex,
    required this.isSelected,
    required this.onTap,
  });

  final int selectedIndex;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.redPinkMain : Colors.transparent,
          borderRadius: BorderRadiusGeometry.circular(18.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
          child: Text(
            text,
            style: isSelected
                ? AppStyles.tSW400S16Oq
                : AppStyles.tSW400S16Pink,
          ),
        ),
      ),
    );
  }
}
