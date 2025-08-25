import 'package:flutter/foundation.dart';
import '../../../data/models/recipes/category_model.dart';
import '../../../data/models/recipes/recipes_model.dart';
import '../../../data/models/top_chefs_model.dart';
import '../../../data/models/trending_model.dart';

import '../../../data/repositories/category_repository.dart';
import '../../../data/repositories/chef_repository.dart';
import '../../../data/repositories/recipe_repository.dart';


class HomeViewModel extends ChangeNotifier {
  // private
  final ChefRepository _chefRepo;
  final CategoryRepository _categoryRepo;

  final RecipeRepository _recipesRepo;

  HomeViewModel({
    required CategoryRepository categoryRepo,

    required RecipeRepository recipesRepo,
    required ChefRepository chefRepo,
  }) : _categoryRepo = categoryRepo,

       _recipesRepo = recipesRepo,
       _chefRepo = chefRepo {
    fetchTrending();
    fetchCategories();
    fetchRecipes();
    fetchTopChefs();
  }

  // bu trending uchun
  TrendingModel? trendingRecipe;
  bool isTrendingLoading = true;
  String? errorTrending;

  Future<void> fetchTrending() async {
    isTrendingLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getTrendingRecipe();
    result.fold(
      (exception) => errorTrending = exception.toString(),
      (value) => trendingRecipe = value,
    );
    isTrendingLoading = false;
    notifyListeners();
  }

  // bu Categories uchun
  List<CategoriesModel> categories = [];
  bool isCategoryLoading = true;
  String? errorCategory;
  int selectedIndex = 0;

  Future<void> fetchCategories() async {
    isCategoryLoading = true;
    notifyListeners();

    var result = await _categoryRepo.getAll();
    result.fold(
      (exception) => errorCategory = exception.toString(),
      (value) => categories = value,
    );
    isCategoryLoading = false;
    notifyListeners();
  }

  void selectedCategory(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  // Recipes

  List<RecipesModel> recipes = [];
  bool isRecipeLoading = false;
  String? recipeError;

  Future<void> fetchRecipes() async {
    isRecipeLoading = true;
    notifyListeners();

    var result = await _recipesRepo.getAll();
    result.fold(
      (exception) => recipeError = exception.toString(),
      (value) => recipes = value,
    );
    isRecipeLoading = false;
    notifyListeners();
  }

  // Topchefsgaaaaaaaaaaaaaaa

  List<TopChefsModel> chefs = [];
  bool isChefsLoading = false;
  String? chefsError;

  Future<void> fetchTopChefs() async {
    isChefsLoading = true;
    notifyListeners();
    var result = await _chefRepo.getAll(queryParams: {"Limit":4});
    result.fold(
      (exception) => chefsError = exception.toString(),
      (value) => chefs = value,
    );
    isChefsLoading = false;
    notifyListeners();
  }
}
