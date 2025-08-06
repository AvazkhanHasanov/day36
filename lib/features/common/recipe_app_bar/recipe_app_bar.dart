import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/common/icon_button_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RecipeAppBar({
    super.key, required this.title,
  });
final String title ;
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56);

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
    );
  }


}
