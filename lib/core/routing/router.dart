import 'package:day_36_darsda1/core/routing/routes.dart';
import 'package:day_36_darsda1/features/auth/pages/login_page.dart';
import 'package:day_36_darsda1/features/auth/pages/password/enter.dart';
import 'package:day_36_darsda1/features/auth/pages/password/send_OTP.dart';
import 'package:day_36_darsda1/features/auth/pages/complete_your_profile_page.dart';
import 'package:day_36_darsda1/features/auth/pages/sign_up_page.dart';
import 'package:day_36_darsda1/features/categories/pages/categories_page.dart';
import 'package:day_36_darsda1/features/categories/pages/recipes_page.dart';
import 'package:day_36_darsda1/features/categories/pages/recipes_detail_page.dart';
import 'package:day_36_darsda1/features/home/pages/home_page.dart';
import 'package:day_36_darsda1/features/onboarding/pages/onboarding_page.dart';
import 'package:day_36_darsda1/features/profile/pages/profile_page.dart';
import 'package:day_36_darsda1/features/reviews/pages/create_review_page.dart';
import 'package:day_36_darsda1/features/reviews/pages/reviews_page.dart';
import 'package:day_36_darsda1/features/top_chefs/pages/chef_profile_page.dart';
import 'package:day_36_darsda1/features/top_chefs/pages/top_chefs_page.dart';
import 'package:day_36_darsda1/features/trending/pages/trending_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/add_recipes/pages/add_recipe_page.dart';
import '../../features/community/pages/community_page.dart';
import '../../features/my_recipes/pages/my_recipes_page.dart';

final router = GoRouter(
  initialLocation:Routes.categoriesPage,

  routes: [
    GoRoute(
      path: Routes.recipesPage,
      builder: (context, state) => RecipesPage(
        title: state.uri.queryParameters['title']!,
        categoryId: int.parse(
          state.pathParameters['id']!,
        ),
      ),
    ),
    GoRoute(path:Routes.categoriesPage, builder: (context, state) => CategoriesPage()),
    GoRoute(
      path: Routes.detailPage,
      builder: (context, state) => RecipesDetailPage(
        detailId: int.parse(
          state.pathParameters['id']!,
        ),
        title: state.uri.queryParameters['title']!,
      ),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Routes.trending,
      builder: (context, state) => TrendingPage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routes.completeYourProfilePage,
      builder: (context, state) => CompleteYourProfilePage(),
    ),
    GoRoute(
      path: Routes.chefProfile,
      builder: (context, state) => ChefProfile(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: Routes.sendOTP,
      builder: (context, state) => SendOTP(),
    ),
    GoRoute(
      path: Routes.enter,
      builder: (context, state) => EnterOTP(),
    ),
    GoRoute(
      path: Routes.topChefs,
      builder: (context, state) => TopChefsPage(),
    ),
    GoRoute(
      path: Routes.myRecipes,
      builder: (context, state) => MyRecipesPage(),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => CommunityPage(),
    ), GoRoute(
      path: Routes.addRecipePage,
      builder: (context, state) => AddRecipePage(),
    ),
    GoRoute(
      path: Routes.profile,
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: Routes.reviews,
      builder: (context, state) => ReviewsPage(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: Routes.createReview,
      builder: (context, state) => CreateReview(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
  ],
);
