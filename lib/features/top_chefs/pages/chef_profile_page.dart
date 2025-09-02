import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/top_chefs/manager/chef_profile_view_model.dart';
import 'package:day_36_darsda1/features/common/widgets/followers_following.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/chef_profile_app_bar.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/profile_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../categories/widgets/recipes_widgets/recipes_image.dart';
import '../../common/widgets/recipes_container.dart';

class ChefProfile extends StatelessWidget {
  const ChefProfile({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChefProfileViewModel(
        chefProfileRepo: context.read(),
        id: id,
        recipesRepo: context.read(),
      ),
      builder: (context, child) => Consumer<ChefProfileViewModel>(
        builder: (context, vm, child) {
          final profile = vm.chefProfile;
          return vm.isProfileLoading || profile == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: ChefProfileAppBar(
                    username: profile.username,
                    profilePhoto: profile.profilePhoto,
                  ),
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 37.w),
                      child: Column(
                        spacing: 12.h,
                        children: [
                          ProfileDescription(
                            firstName: profile.firstName,
                            lastName: profile.lastName,
                            presentation: profile.presentation,
                            profilePhoto: profile.profilePhoto,
                          ),

                          FollowersFollowing(
                            followerCount: profile.followerCount,
                            followingCount: profile.followingCount,
                            recipesCount: profile.recipesCount,
                          ),

                          Text('Recipes', style: AppStyles.subtextOq.copyWith(color: Theme.of(context).colorScheme.primary)),
                          Divider(
                            color: AppColors.redPinkMain,
                          ),
                          vm.isRecipesLoading || vm.recipes == null
                              ? Center(child: CircularProgressIndicator())
                              : Expanded(
                                    child: GridView.builder(
                                      itemCount: vm.recipes!.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10.w,
                                        mainAxisExtent: 236.h,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              context.push(
                                                '/detail/${vm.recipes![index].id}?title=${vm.recipes![index].title}',
                                              );
                                            },
                                            child: Stack(
                                              children: [
                                                RecipesContainer(
                                                  timeRequired: vm.recipes![index].timeRequired,
                                                  rating: vm.recipes![index].rating,
                                                  title: vm.recipes![index].title,
                                                  description: vm.recipes![index].description,
                                                ),
                                                RecipesImage(
                                                  photo: vm.recipes![index].photo,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
