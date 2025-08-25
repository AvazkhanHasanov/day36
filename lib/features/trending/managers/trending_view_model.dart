import 'package:day_36_darsda1/data/models/recipes/recipes_model.dart';
import 'package:day_36_darsda1/data/models/trending_model.dart';
import 'package:day_36_darsda1/data/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class TrendingViewModel extends ChangeNotifier {

  final RecipeRepository _recipesRepo;

  TrendingViewModel({
    required this.categoryId,
    required RecipeRepository recipesRepo,

  }) :
       _recipesRepo = recipesRepo {
    fetchTrending();
    fetchRecipes(categoryId);
  }

  final int categoryId;
  TrendingModel? trending;

  bool isTrendingLoading = true;
  String? error;

  Future<void> fetchTrending() async {
    isTrendingLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getTrendingRecipe();
    result.fold(
      (exception) => error = exception.toString(),
      (value) => trending = value,
    );
    isTrendingLoading = false;
    notifyListeners();
  }

  bool isRecipesLoading = false;
  String? recipesError;
  List<RecipesModel> recipes = [];

  Future<void> fetchRecipes(int categoryId) async {
    isRecipesLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getAll(
      queryParam: {'Category': categoryId, "Limit": 2},
    );
    result.fold(
      (exception) => recipesError = exception.toString(),
      (value) => recipes = value,
    );
    isRecipesLoading = false;
    notifyListeners();
  }
}
