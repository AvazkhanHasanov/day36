import 'package:day_36_darsda1/features/common/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:day_36_darsda1/features/common/recipe_app_bar/recipe_app_bar.dart';
import 'package:day_36_darsda1/features/my_recipes/manages/my_recipes_view_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../common/recipes_sized_box.dart';
import '../../home/widgets/recently/recently_sized_box.dart';

class MyRecipesPage extends StatelessWidget {
  const MyRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(title: 'Your Recipes'),
      body: ChangeNotifierProvider(
        create: (context) => MyRecipesViewModel(recipesRepo: context.read()),
        builder: (context, child) => Consumer<MyRecipesViewModel>(
          builder: (context, vm, child) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: 255.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.redPinkMain,
                    borderRadius: BorderRadiusGeometry.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 14.h),
                    child: Column(
                      spacing: 9.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your recipes',
                          style: AppStyles.subtitleOq,
                        ),
                        Row(
                          spacing: 17.w,
                          children: [
                            ...List.generate(
                              vm.my2.length,
                              (index) {
                                return RecipesSizedBox(
                                  id: vm.my2[index].id,
                                  photo: vm.my2[index].photo,
                                  title: vm.my2[index].title,
                                  rating: vm.my2[index].rating,
                                  timeRequired: vm.my2[index].timeRequired,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: vm.my.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 30.h),
                  itemBuilder: (context, index) => Center(
                    child: RecentlySizedBox(
                      id: vm.my[index].id,
                      description: vm.my[index].description,
                      title: vm.my[index].title,
                      rating: vm.my[index].rating,
                      timeRequired: vm.my[index].timeRequired,
                      photo: vm.my[index].photo,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
