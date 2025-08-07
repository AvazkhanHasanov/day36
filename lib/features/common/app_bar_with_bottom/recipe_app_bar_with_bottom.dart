import 'package:day_36_darsda1/core/route/route_name.dart';
import 'package:day_36_darsda1/features/categories/managers/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';
import '../icon_button_app_bar.dart';
import 'bottom.dart';

class RecipeAppBarWithBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarWithBottom({
    super.key,
    required this.title,
    required this.id,
  });

  final String title;
  final int id;

  @override
  Size get preferredSize => Size(double.infinity, 90.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          context.go(RouteName.categoriesPage);
        },
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
          onPressed: () {},
        ),
        SizedBox(width: 5.w),
        IconButtonAppBar(
          icon: AppIcons.search,
          backgroundColor: AppColors.pink,
          foregroundColor: AppColors.pinkSubC,
          onPressed: () {},
        ),
      ],
      bottom: Bottom(
        id: id,
      ),
    );
  }
}
