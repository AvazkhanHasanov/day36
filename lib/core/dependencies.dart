import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repositories/allergic_repository.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/category_repository.dart';
import '../data/repositories/chef_profile_repository.dart';
import '../data/repositories/detail_repository.dart';
import '../data/repositories/onboarding_repository.dart';
import '../data/repositories/preferences_repository.dart';
import '../data/repositories/recipes_repository.dart';
import '../data/repositories/top_chefs_repository.dart';
import '../data/repositories/trending_repository.dart';
import '../features/auth/managers/auth_view_model.dart';
import '../features/categories/managers/categories_view_model.dart';
import '../features/onboarding/managers/onboarding_view_model.dart';
import 'auth_interceptor/auth_interceptor.dart';
import 'client.dart';

final dependencies = <SingleChildWidget>[
  Provider(create: (context) => FlutterSecureStorage()),
  Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
  Provider(create: (context) => ApiClient(interceptor:context.read())),
  Provider(create: (context) => AllergicRepository(client: context.read())),
  Provider(
    create: (context) => AuthRepository(client: context.read(), secureStorage: context.read()),
  ),
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
];
