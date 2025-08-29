import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/profile/managers/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../data/models/recipes/recipes_model.dart';
import '../../categories/widgets/recipes_widgets/recipes_image.dart';
import '../../common/widgets/recipes_container.dart';

class ProfileRecipes extends StatelessWidget {
  const ProfileRecipes({
    super.key,
    required this.recipes,
  });

  final List<RecipesModel>? recipes;

  @override
  Widget build(BuildContext context) {
    return Selector<ProfileViewModel, List<RecipesModel>?>(
      selector: (context, vm) => vm.recipes,
      builder: (context, recipes, child) {
        final isLoading = context.select<ProfileViewModel, bool>(
          (value) => value.isRecipesLoading,
        );
        if (recipes == null || recipes.isEmpty) {
          return Text(
            'no recipes yet',
            style: AppStyles.subtext.copyWith(
              color: AppColors.brownF9,
            ),
          );
        }
        if (isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          itemCount: recipes.length,
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
                    '/detail/${recipes[index].id}?title=${recipes[index].title}',
                  );
                },
                child: Stack(
                  children: [
                    RecipesContainer(
                      timeRequired: recipes[index].timeRequired,
                      rating: recipes[index].rating,
                      title: recipes[index].title,
                      description: recipes[index].description,
                    ),
                    RecipesImage(
                      photo: recipes[index].photo,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
