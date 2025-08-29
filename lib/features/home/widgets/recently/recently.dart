import 'package:day_36_darsda1/features/home/widgets/recently/recently_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/styles.dart';
import '../../../../data/models/recipes/recipes_model.dart';
import '../../managers/home_view_model.dart';

class Recently extends StatelessWidget {
  const Recently({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 9.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recently Added',
            style: AppStyles.subtitle,
          ),
          Selector<HomeViewModel, List<RecipesModel>>(
            selector: (context, vm) => vm.recipes,
            builder: (context, recipes, child) {
              final isLoading = context.select<HomeViewModel, bool>(
                (value) => value.isRecipeLoading,
              );
              if (isLoading) {
                return Center(child: CircularProgressIndicator());
              }

              return Row(
                spacing: 18.w,
                children: [
                  ...List.generate(
                    2,
                    (index) {
                      return RecentlySizedBox(
                        id: recipes[index].id,
                        description: recipes[index].description,
                        title: recipes[index].title,
                        rating: recipes[index].rating,
                        timeRequired: recipes[index].timeRequired,
                        photo: recipes[index].photo,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
