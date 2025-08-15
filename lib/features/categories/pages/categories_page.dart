import 'package:day_36_darsda1/features/categories/managers/categories_view_model.dart';
import 'package:day_36_darsda1/features/common/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:day_36_darsda1/features/categories/widgets/categories_grid.dart';
import 'package:day_36_darsda1/features/common/recipe_app_bar/recipe_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesViewModel>(
      builder: (context, vm, child) {
        if (vm.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            extendBody: true,
            appBar: RecipeAppBar(
              title: 'Categories',
            ),
            body: GridView.builder(
              itemCount: vm.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.h,
                mainAxisExtent: 172.h,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return CategoriesGrid(
                  image: vm.categories[index].image,
                  title: vm.categories[index].title,
                  categoryId: vm.categories[index].id,
                );
              },
            ),
            bottomNavigationBar: RecipeBottomNavigationBar(),
          );
        }
      },
    );
  }
}
