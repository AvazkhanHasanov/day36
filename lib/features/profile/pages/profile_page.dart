import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:day_36_darsda1/features/profile/managers/profile_view_model.dart';
import 'package:day_36_darsda1/features/profile/widgets/profile_favorites.dart';
import 'package:day_36_darsda1/features/profile/widgets/profile_recipes.dart';
import 'package:day_36_darsda1/features/profile/widgets/profile_detail.dart';
import 'package:day_36_darsda1/features/profile/widgets/tab_text.dart';
import 'package:day_36_darsda1/features/profile/widgets/text_bottoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/followers_following.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(
        authRepo: context.read(),
        recipesRepo: context.read(),
      ),
      builder: (context, child) => Scaffold(
        extendBody: true,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 37.w, right: 37.w, top: 17.h),
            child: Consumer<ProfileViewModel>(
              builder: (context, vm, child) {
                if (vm.isProfileLoading) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (vm.profile == null) {
                  return Center(
                    child: Text(
                      'Malumotlar yoq',
                      style: AppStyles.tSW400S15Oq,
                    ),
                  );
                }
                return Column(
                  spacing: 12,
                  children: [
                    ProfileDetail(
                      profilePhoto: vm.profile!.profilePhoto,
                      firstName: vm.profile!.firstName,
                      lastName: vm.profile!.lastName,
                      username: vm.profile!.username,
                      presentation: vm.profile!.presentation,
                    ),
                    textBottoms(),
                    FollowersFollowing(
                      followerCount: vm.profile!.followerCount,
                      followingCount: vm.profile!.followingCount,
                      recipesCount: vm.profile!.recipesCount,
                    ),
                    TabBar(
                      dividerColor: Colors.transparent,
                      indicatorWeight: 2.w,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppColors.redPinkMain,
                      controller: _controller,
                      tabs: [
                        Tab(child: TabText(text: 'Recipe')),
                        Tab(child: TabText(text: 'Favorites')),
                      ],

                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _controller,
                        children: [
                          ProfileRecipes(
                            recipes: vm.recipes,
                          ),
                          ProfileFavorites(),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
