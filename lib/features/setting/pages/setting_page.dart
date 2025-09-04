import 'package:day_36_darsda1/core/routing/routes.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:day_36_darsda1/features/common/widgets/recipe_app_bar_with_title.dart';
import 'package:day_36_darsda1/features/setting/widgets/setting_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/managers/themes_view_model.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBarWithTitle(text: 'Setting'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children: [
            SettingRow(
              icon: AppIcons.notification,
              title: 'Notification',
              onTap: () {
                context.push(Routes.notification);
              },
            ),
            SettingRow(icon: AppIcons.headset, title: 'Help Center', onTap: () {}),
            SettingRow(icon: AppIcons.privacy, title: 'Privacy Policy', onTap: () {}),
            SettingRow(icon: AppIcons.reviewsBig, title: 'Language', onTap: () {}),
            SettingRow(
              icon: AppIcons.change,
              title: 'Turn dark Theme',
              isRight: false,
              onTap: () {
                context.read<ThemeViewModel>().changeTheme();
              },
            ),
            SettingRow(icon: AppIcons.logOut, title: 'Log Out', onTap: () {}, isRight: false),
            Text('Delete Account', style: AppStyles.subtitle.copyWith(color: AppColors.pinkSubC)),
          ],
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
