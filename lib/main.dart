import 'package:day_36_darsda1/core/route/router.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/features/auth/managers/auth_view_model.dart';
import 'package:day_36_darsda1/features/categories/managers/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CategoriesViewModel()),
          ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ],
        child: MaterialApp.router(
          theme: ThemeData(scaffoldBackgroundColor: AppColors.beige),
          routerConfig: router,
        ),
      ),
    );
  }
}
