import 'package:day_36_darsda1/core/route/route_name.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_page.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_recipes_page.dart';
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
  ],
);