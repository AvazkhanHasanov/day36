import 'package:day_36_darsda1/core/route/route_name.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_page.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_recipes_page.dart';
import 'package:day_36_darsda1/features/categories/pages/detail_page.dart';
import 'package:day_36_darsda1/features/onboarding/pages/allergic_page.dart';
import 'package:day_36_darsda1/features/onboarding/pages/cooking_level_page.dart';
import 'package:day_36_darsda1/features/onboarding/pages/preferences_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RouteName.categoriesPage,
  routes: [
    GoRoute(
      path: '/recipes/:id',
      builder: (context, state) => CategoriesRecipesPage(
        title: state.uri.queryParameters['title']!,
        categoryId: int.parse(
          state.pathParameters['id']!,
        ),
      ),
    ),
    GoRoute(path: '/categories', builder: (context, state) => CategoriesPage()),
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) => DetailPage(
        title: state.uri.queryParameters['title']!,
        detailId: int.parse(
          state.pathParameters['id']!,
        ),
      ),
    ),
    GoRoute(
      path: '/level',
      builder: (context, state) => CookingLevelPage(),
    ),
    GoRoute(
      path: '/preferences',
      builder: (context, state) => PreferencesPage(),
    ),GoRoute(
      path: '/allergic',
      builder: (context, state) => AllergicPage(),
    ),
  ],
);
