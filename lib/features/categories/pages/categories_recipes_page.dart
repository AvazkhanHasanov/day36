import 'package:day_36_darsda1/features/categories/managers/recipes_view_model.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_container.dart';
import 'package:day_36_darsda1/features/categories/widgets/recipes_widgets/recipes_image.dart';
import 'package:day_36_darsda1/features/common/app_bar_with_bottom/recipe_app_bar_with_bottom.dart';
import 'package:day_36_darsda1/features/common/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoriesRecipesPage extends StatelessWidget {
  final int categoryId;
  final String title;

  const CategoriesRecipesPage({
    super.key,
    required this.categoryId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipesViewModel(categoryId: categoryId),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: RecipeAppBarWithBottom(
          title: title,
          id: categoryId,
        ),
        body: Consumer<RecipesViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                itemCount: vm.elements.length,
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
                          '/detail/${vm.elements[index].id}?title=$title',
                        );
                      },
                      child: Stack(
                        children: [
                          RecipesContainer(
                            timeRequired: vm.elements[index].timeRequired,
                            rating: vm.elements[index].rating,
                            title: vm.elements[index].title,
                            description: vm.elements[index].description,
                          ),
                          RecipesImage(
                            photo: vm.elements[index].photo,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
