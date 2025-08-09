import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/features/common/icon_button_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  OnboardingPageAppBar({
    super.key,
    required this.currentState,
  });

  final int currentState;

  @override
  Size get preferredSize => Size(double.infinity, 56);
  final alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButtonAppBar(
        icon: AppIcons.backArrow,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.redPinkMain,
        onPressed: () {
          context.pop();
        },
      ),
      centerTitle: true,
      title: Container(
        alignment: (alignments[currentState]),
        width: 230.w,
        height: 12.h,
        decoration: BoxDecoration(
          color: AppColors.colorD9,
          borderRadius: BorderRadiusGeometry.circular(6.r),
        ),
        child: Container(
          width: 65.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: AppColors.redPinkMain,
            borderRadius: BorderRadiusGeometry.circular(6.r),
          ),
        ),
      ),
    );
  }
}
