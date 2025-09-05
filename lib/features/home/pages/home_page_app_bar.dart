import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/features/home/widgets/app_bar_icon_button.dart';
import 'package:day_36_darsda1/features/home/widgets/home_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/styles.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override

  Size get preferredSize => Size(double.infinity, 120.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      toolbarHeight: 70,

      title: Padding(
        padding: EdgeInsets.only(left: 19.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi! Khan', style: AppStyles.titleAB),
            Text(
              'What are you cooking today',
              style: AppStyles.subtextOq.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.only(right: 19.w),
      actions: [
        AppBarIconButton(
          onPressed: () {},
          icon: AppIcons.notification,
        ),
        SizedBox(width: 6.w),
        AppBarIconButton(
          onPressed: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) => Align(
                child: Material(

                ),
              ),
            );
          },
          icon: AppIcons.search,
        ),
      ],
      bottom: HomeBottom(),
    );
  }
}
