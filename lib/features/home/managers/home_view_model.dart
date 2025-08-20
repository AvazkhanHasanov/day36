import 'package:day_36_darsda1/data/repositories/top_chefs_repository.dart';
import 'package:flutter/foundation.dart';
import '../../../data/models/recipes/category_model.dart';
import '../../../data/models/recipes/recipes_model.dart';
import '../../../data/models/top_chefs_model.dart';
import '../../../data/models/trending_model.dart';

import '../../../data/repositories/category_repository.dart';
import '../../../data/repositories/recipes_repository.dart';
import '../../../data/repositories/trending_repository.dart';

class HomeViewModel extends ChangeNotifier {
  // private
  final TopChefsRepository _topChefsRepo;
  final CategoryRepository _categoryRepo;
  final TrendingRepository _trendingRepo;
  final RecipesRepository _recipesRepo;

  HomeViewModel({
    required CategoryRepository categoryRepo,
    required TrendingRepository trendingRepo,
    required RecipesRepository recipesRepo,
    required TopChefsRepository topChefsRepo,
  }) : _categoryRepo = categoryRepo,
       _trendingRepo = trendingRepo,
       _recipesRepo = recipesRepo,
       _topChefsRepo = topChefsRepo {
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
    var result = await _trendingRepo.getOne();
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
    var result = await _topChefsRepo.getAll(queryParams: {"Limit":4});
    result.fold(
      (exception) => chefsError = exception.toString(),
      (value) => chefs = value,
    );
    isChefsLoading = false;
    notifyListeners();
  }
}
