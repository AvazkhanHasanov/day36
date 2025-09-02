import 'package:day_36_darsda1/core/dependencies.dart';
import 'package:day_36_darsda1/features/common/managers/themes_view_model.dart';
import 'package:day_36_darsda1/features/common/pages/apptheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/routing/router.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: dependencies,
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode: context.watch<ThemeViewModel>().mode,
          routerConfig: router,
        ),
      ),
    );
  }
}
