import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/route/router.dart';
import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/data/repositories/allergic_repository.dart';
import 'package:day_36_darsda1/data/repositories/auth_repository.dart';
import 'package:day_36_darsda1/data/repositories/category_repository.dart';
import 'package:day_36_darsda1/data/repositories/chef_profile_repository.dart';
import 'package:day_36_darsda1/data/repositories/detail_repository.dart';
import 'package:day_36_darsda1/data/repositories/onboarding_repository.dart';
import 'package:day_36_darsda1/data/repositories/preferences_repository.dart';
import 'package:day_36_darsda1/data/repositories/recipes_repository.dart';
import 'package:day_36_darsda1/data/repositories/top_chefs_repository.dart';
import 'package:day_36_darsda1/data/repositories/trending_repository.dart';
import 'package:day_36_darsda1/features/auth/managers/auth_view_model.dart';
import 'package:day_36_darsda1/features/categories/managers/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'features/onboarding/managers/onboarding_view_model.dart';

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
          Provider(create: (context) => FlutterSecureStorage()),
          Provider(create: (context) => ApiClient(secureStorage: context.read())),
          Provider(create: (context) => AllergicRepository(client: context.read())),
          Provider(
            create: (context) => AuthRepository(client: context.read(), secureStorage: context.read())),
          Provider(create: (context) => CategoryRepository(client: context.read<ApiClient>())),
          Provider(create: (context) => ChefProfileRepository(client: context.read())),
          Provider(create: (context) => DetailRepository(client: context.read())),
          Provider(create: (context) => OnboardingRepository(client: context.read())),
          Provider(create: (context) => PreferencesRepository(client: context.read())),

          Provider(create: (context) => RecipesRepository(client: context.read())),
          Provider(create: (context) => TopChefsRepository(client: context.read())),
          Provider(create: (context) => TrendingRepository(client: context.read())),
          ChangeNotifierProvider(create: (context) => CategoriesViewModel(categoryRepo: context.read())),
          ChangeNotifierProvider(create: (context) => AuthViewModel(authRepo: context.read())),
          ChangeNotifierProvider(
            create: (context) => OnboardingViewModel(onboardingRepo: context.read(), categoryRepo: context.read()),
          ),
        ],
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
