import 'package:day_36_darsda1/core/route/routes.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/features/common/recipes_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/styles.dart';
import '../../managers/home_view_model.dart';

class YourRecipe extends StatelessWidget {
  const YourRecipe({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.myRecipes),
      child: Container(
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
              Consumer<HomeViewModel>(
                builder: (context, vm, child) {
                  return vm.isRecipeLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : Row(
                    spacing: 17.w,
                    children: [
                      ...List.generate(
                        2,
                            (index) {
                          return RecipesSizedBox(
                            id: vm.recipes[index].id,
                            photo: vm.recipes[index].photo,
                            title: vm.recipes[index].title,
                            rating: vm.recipes[index].rating,
                            timeRequired: vm.recipes[index].timeRequired,
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
      ),
    );
  }
}
