import 'package:day_36_darsda1/features/common/app_bar_with_bottom/app_bar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';
import '../icon_button_app_bar.dart';

class RecipeAppBarWithBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarWithBottom({super.key, required this.title});

  final String title;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 90.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(AppIcons.backArrow),
      ),
      centerTitle: true,
      title: Text(title, style: AppStyles.appBarT),
      actionsPadding: EdgeInsets.only(right: 37.w),
      actions: [
        IconButtonAppBar(
          icon: AppIcons.notification,
          backgroundColor: AppColors.pink,
          foregroundColor: AppColors.pinkSubC,
        ),
        SizedBox(width: 5.w),
        IconButtonAppBar(
          icon: AppIcons.search,
          backgroundColor: AppColors.pink,
          foregroundColor: AppColors.pinkSubC,
        ),
      ],
      bottom: AppBarBottom(
        text: 'Breakfast',
      ),
    );
  }
}
