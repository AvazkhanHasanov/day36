import 'package:day_36_darsda1/features/common/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:day_36_darsda1/features/common/recipe_app_bar/recipe_app_bar.dart';
import 'package:day_36_darsda1/features/top_chefs/manager/top_chefs_view_model.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/top_chefs/chef_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';

class TopChefsPage extends StatelessWidget {
  const TopChefsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopChefsViewModel(chefRepo: context.read()),
      builder: (context, child) {
        return Scaffold(
          extendBody: true,
          appBar: RecipeAppBar(title: 'Top Chefs'),
          body: SingleChildScrollView(
            child: Column(
              spacing: 9.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<TopChefsViewModel>(
                  builder: (context, vm, child) {
                    return vm.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            spacing: 15.w,
                            children: [
                              ...List.generate(
                                vm.chefs.length,
                                (index) {
                                  var pageItem = vm.chefs[index];
                                  final bool isZero = index == 0;
                                  List title = [
                                    'Most viewed chefs',
                                    'Most Liked chefs',
                                    'New chefs',
                                  ];
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 36.w,
                                      vertical: isZero ? 18.h : 1.h,
                                    ),
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    // constraints: BoxConstraints(
                                    //   minHeight:isZero? 285.h:258.h,
                                    //   maxHeight: isZero?295.h:258.h,
                                    // ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        20.r,
                                      ),
                                      color: isZero ? AppColors.redPinkMain : Colors.transparent,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      spacing: 9.h,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title[index],
                                          style: isZero ? AppStyles.subtitleOq : AppStyles.subtitle,
                                        ),
                                        Row(
                                          spacing: 18.w,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: List.generate(
                                            pageItem.length,
                                            (index) {
                                              final chef = pageItem[index];
                                              return ChefStack(
                                                photo: chef.profilePhoto,
                                                firstName: chef.firstName,
                                                username: chef.username,
                                                id: chef.id,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: RecipeBottomNavigationBar(),
        );
      },
    );
  }
}
