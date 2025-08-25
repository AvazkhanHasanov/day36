import 'package:day_36_darsda1/core/dependencies.dart';
import 'package:day_36_darsda1/core/route/router.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
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
        providers: dependencies,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.beige,
            appBarTheme: AppBarTheme(backgroundColor: AppColors.beige),
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
