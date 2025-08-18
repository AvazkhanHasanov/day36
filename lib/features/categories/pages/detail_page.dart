import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/managers/detail_view_model.dart';
import 'package:day_36_darsda1/features/categories/widgets/detail_page_rich_text.dart';
import 'package:day_36_darsda1/features/categories/widgets/detail_profile.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/common/recipe_app_bar/recipe_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/detail_repository.dart';
import '../widgets/detail_page/detail_page_stack.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.detailId, required this.title});

  final int detailId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailViewModel(
        detailId: detailId,
        detailRepo: context.read<DetailRepository>(),
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: RecipeAppBar(
            title: title,
          ),
          body: SingleChildScrollView(
            child: Consumer<DetailViewModel>(
              builder: (context, vm, child) {
                final detail = vm.detail!;
                if (vm.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailPageStack(
                          photo: detail.photo,
                          title: detail.title,
                          rating: detail.rating,
                        ),
                        SizedBox(height: 26.h),
                        DetailProfile(
                          profilePhoto: detail.user.profilePhoto,
                          username: detail.user.userName,
                          firstName: detail.user.firstName,
                          lastName: detail.user.lastName,
                        ),
                        Column(
                          spacing: 5.h,
                          children: [
                            Row(
                              spacing: 7.w,
                              children: [
                                Text('Details', style: AppStyles.titlle),
                                SizedBox(width: 8.w),
                                RecipesIconButton(
                                  icon: AppIcons.clock,
                                  onPressed: () {},
                                  foregroundColor: AppColors.brownF9,
                                  backgroundColor: Colors.transparent,
                                ),
                                Text(
                                  '${detail.timeRequired} min',
                                  style: AppStyles.subtextOq,
                                ),
                              ],
                            ),
                            Text(
                              '''A savory Thai dish featuring tender chicken, rice noodles, and a flavorful sauce made from soy sauce, fish sauce, tamarind paste, and brown sugar, topped with bean sprouts, peanuts, and fresh cilantro for a delightful balance of flavors and textures.''',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.brownF9,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 31.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ingredients',
                              style: AppStyles.titlle,
                            ),
                            SizedBox(height: 26.h),
                            ...List.generate(
                              detail.ingredients.length,
                              (index) {
                                return DetailPageRichText(
                                  text: detail.ingredients[index].name,
                                  order: detail.ingredients[index].amount,
                                );
                              },
                            ),
                            SizedBox(height: 31.h),
                            Text(
                              '${detail.instructions.length} Easy Steps',
                              style: AppStyles.titlle,
                            ),
                            SizedBox(height: 11.h),
                            ...List.generate(
                              detail.instructions.length,
                              (index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 11.h),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                    ),
                                    width: 356.w,
                                    height: 81.h,
                                    decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? AppColors.pinkSubC
                                          : AppColors.pink,
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    child: Text(
                                      '${index + 1}. ${detail.instructions[index].text} ',
                                      style: AppStyles.subtextB,
                                      maxLines: 3,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
