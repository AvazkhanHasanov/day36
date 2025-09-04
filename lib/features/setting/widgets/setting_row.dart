import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
     this.isRight=true,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        spacing: 18.w,
        children: [
          RecipesIconButton(
            icon: icon,
            onPressed: () {},
            backgroundColor: AppColors.redPinkMain,
            foregroundColor: AppColors.brownF9,
            size: Size(35.r, 35.r),
          ),
          Text(
            title,
            style: AppStyles.subtitle.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Spacer(),
          isRight
              ? RecipesIconButton(
                  icon: AppIcons.right,
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.redPinkMain,
                  size: Size(20.w, 17.h),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
