import 'package:day_36_darsda1/core/route/routes.dart';
import 'package:day_36_darsda1/features/auth/pages/login_page.dart';
import 'package:day_36_darsda1/features/auth/pages/password/enter.dart';
import 'package:day_36_darsda1/features/auth/pages/password/send_OTP.dart';
import 'package:day_36_darsda1/features/auth/pages/profile_page.dart';
import 'package:day_36_darsda1/features/auth/pages/sign_up_page.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_page.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_recipes_page.dart';
import 'package:day_36_darsda1/features/categories/pages/detail_page.dart';
import 'package:day_36_darsda1/features/home/pages/home_page.dart';
import 'package:day_36_darsda1/features/onboarding/pages/onboarding_page.dart';
import 'package:day_36_darsda1/features/reviews/pages/create_review_page.dart';
import 'package:day_36_darsda1/features/reviews/pages/reviews_page.dart';
import 'package:day_36_darsda1/features/top_chefs/pages/chef_profile_page.dart';
import 'package:day_36_darsda1/features/top_chefs/pages/top_chefs_page.dart';
import 'package:day_36_darsda1/features/trending/pages/trending_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/community/pages/community_page.dart';

final router = GoRouter(
  initialLocation: '/community',
  redirect: (context, state) async {
    final token = await context.read<FlutterSecureStorage>().read(key: 'token');
    if (state.matchedLocation == Routes.login && token != null) {
      return Routes.home;
    }
    return null;
  },
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
        detailId: int.parse(
          state.pathParameters['id']!,
        ),
        title: state.uri.queryParameters['title']!,
      ),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/trending',
      builder: (context, state) => TrendingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/signUp',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: '/chefProfile/:id',
      builder: (context, state) => ChefProfile(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/forgotPassword',
      builder: (context, state) => ForgotPassword(),
    ),
    GoRoute(
      path: '/enter',
      builder: (context, state) => EnterPage(),
    ),
    GoRoute(
      path: '/topChefs',
      builder: (context, state) => TopChefsPage(),
    ),
    GoRoute(
      path: '/community',
      builder: (context, state) => CommunityPage(),
    ),
    GoRoute(
      path: '/reviews/:id',
      builder: (context, state) => ReviewsPage(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/createReview/:id',
      builder: (context, state) => CreateReview(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
  ],
);
