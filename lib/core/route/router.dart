import 'package:day_36_darsda1/features/categories/pages/categories_page.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_recipes_page.dart';
import 'package:day_36_darsda1/features/categories/pages/detail_page.dart';
import 'package:day_36_darsda1/features/onboarding/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/onboarding',
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
      path: '/onboarding',
      builder: (context, state) => OnboardingPage(),
    ),
  ],
);
