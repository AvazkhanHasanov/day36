import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/icons.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/categories/managers/detail_view_model.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_icon_button.dart';
import 'package:day_36_darsda1/features/common/recipe_app_bar/recipe_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/detail_page/detail_page_stack.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.detailId, required this.title});

  final int detailId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailViewModel(detailId: detailId),
      builder: (context, child) {
        return Scaffold(
          appBar: RecipeAppBar(
            title: title,
          ),
          body: Consumer<DetailViewModel>(
            builder: (context, vm, child) {
              if (vm.isLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailPageStack(
                        photo: vm.detail!.photo,
                        title: vm.detail!.title,
                        rating: vm.detail!.rating,
                      ),
                      SizedBox(height: 26.h),
                      Row(
                        spacing: 9.w,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(61.5.r),
                            child: Image.asset(
                              'assets/image.png',
                              width: 61.w,
                              height: 63.h,
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@josh-ryan',
                                style: AppStyles.subTextRed,
                              ),
                              Text(
                                'Josh Ryan-Chef',
                                style: AppStyles.paragraph,
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: 109.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.circular(
                                21.82.r,
                              ),
                              color: AppColors.pink,
                            ),
                            child: Text(
                              'Following',
                              style: AppStyles.subtitle,
                            ),
                          ),
                          RecipesIconButton(
                            icon: AppIcons.threeDots,
                            onPressed: () {},
                            backgroundColor: Colors.transparent,
                            foregroundColor: AppColors.redPinkMain,
                          ),
                        ],
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
                                '${vm.detail!.timeRequired} min',
                                style: AppStyles.subTextOq,
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
                          RichText(
                            text: TextSpan(
                              text: '• 8',
                              style: AppStyles.subTextRed,
                              children: [
                                TextSpan(
                                  text: 'oz (about 225g) rice noodles',
                                  style: AppStyles.subTextOq,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
