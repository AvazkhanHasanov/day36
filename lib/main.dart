import 'package:day_36_darsda1/core/route/router.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/features/categories/managers/categories_view_model.dart';
import 'package:day_36_darsda1/features/categories/managers/recipes_view_model.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_page.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_recipes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Day36App());
}

class Day36App extends StatelessWidget {
  const Day36App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: ChangeNotifierProvider(
        create: (context) => CategoriesViewModel(),
        builder: (context, child) => MaterialApp.router(
          theme: ThemeData(scaffoldBackgroundColor: AppColors.beige),
          routerConfig: router,
        ),
      ),
    );
  }
}
