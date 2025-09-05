import 'package:day_36_darsda1/data/models/recipes/recipes_model.dart';
import 'package:day_36_darsda1/data/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class RecipesViewModel extends ChangeNotifier {
  final RecipeRepository _recipesRepo;

  RecipesViewModel({
    required this.categoryId,
    required RecipeRepository recipesRepo,
  }) : _recipesRepo = recipesRepo {
    fetchRecipes(categoryId);
  }

  final int categoryId;
  List<RecipesModel> elements = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchRecipes(int categoryId) async {
    isLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getAll(queryParam: {'Category': categoryId});

    result.fold(
      (exception) => error = exception.toString(),
      (value) => elements = value,
    );

    isLoading = false;
    notifyListeners();
  }
}
