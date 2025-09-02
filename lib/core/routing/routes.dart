class Routes {
  static final categoriesPage = '/categories';
  static final recipesPage = '/recipes/:id';
  static final detailPage = '/detail/:id';
  static String getDetailPage(int id) => '/detail/$id';
  static final onboarding = '/onboarding';
  static final login = '/login';
  static final signUp = '/signUp';
  static final completeYourProfilePage = '/completeYourProfilePage';
  static final sendOTP = '/SendOTP';
  static final enter = '/enter';
  static final trending = '/trending';
  static final home = '/home';
  static final topChefs = '/topChefs';
  static final chefProfile = '/chefProfile/:id';
  static String getChefProfile(int id) => '/chefProfile/$id';
  static final reviews = '/reviews/:id';
  static String getReviews(int id)=> '/reviews/$id';
  static final createReview = '/createReview/:id';
  static String getCreateReview(int id) => '/createReview/$id';
  static final myRecipes = '/myRecipes';
  static final profile = '/profile';
  static final addRecipePage = '/addRecipePage';
  static final community = '/community';
}
