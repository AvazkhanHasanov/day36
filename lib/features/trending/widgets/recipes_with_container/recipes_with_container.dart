import 'package:day_36_darsda1/features/trending/managers/trending_view_model.dart';
import 'package:day_36_darsda1/features/trending/widgets/recipes_with_container/resipes_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RecipesWithContainer extends StatelessWidget {
  const RecipesWithContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TrendingViewModel>(
        builder: (context, vm, child) {
          if (vm.isRecipesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: 36.w,
                vertical: 33.h,
              ),
              itemCount: vm.recipes.length,
              itemBuilder: (context, index) {
                final recipes = vm.recipes[index];
                return RecipesStack(
                  id: recipes.id,
                  title: recipes.title,
                  description: recipes.description,
                  timeRequired: recipes.timeRequired,
                  rating: recipes.timeRequired,
                  photo: recipes.photo,
                );
              },
            );
          }
        },
      ),
    );
  }
}
