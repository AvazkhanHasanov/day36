import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/features/common/managers/themes_view_model.dart';
import 'package:day_36_darsda1/features/home/widgets/app_bar_icon_button.dart';
import 'package:day_36_darsda1/features/home/widgets/home_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/styles.dart';
import '../../common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import '../managers/home_view_model.dart';
import '../widgets/recently/recently.dart';
import '../widgets/recipes/your_resipes.dart';
import '../widgets/topchef/top_chef.dart';
import '../widgets/trending/trending.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        categoryRepo: context.read(),
        recipesRepo: context.read(),
        chefRepo: context.read(),
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Text('Hi! Khan', style: AppStyles.titleAB),
              Text('What are you cooking today', style: AppStyles.subtextOq.copyWith(color: Theme.of(context).colorScheme.primary)),
            ],
          ),
          actions: [
            AppBarIconButton(
              onPressed: () {
                context.read<ThemeViewModel>().changeTheme();
              },
              icon: AppIcons.threeDots,
            ),
            AppBarIconButton(
              onPressed: () {},
              icon: AppIcons.notification,
            ),
            SizedBox(width: 6.w),
            AppBarIconButton(
              onPressed: () {},
              icon: AppIcons.search,
            ),
          ],

          bottom: HomeBottom(),
        ),
        body: SafeArea(
          top: true,
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 19.h),
              child: Column(
                spacing: 19.h,
                children: [
                  Trending(),
                  YourRecipe(),
                  TopChef(),
                  Recently(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
