import 'package:day_36_darsda1/data/models/category/recipes_model.dart';
import 'package:day_36_darsda1/data/repositories/recipes_repository.dart';
import 'package:flutter/material.dart';

class RecipesViewModel extends ChangeNotifier {
  final RecipesRepository _recipesRepo;

  RecipesViewModel({
    required this.categoryId,
    required RecipesRepository recipesRepo,
  }) : _recipesRepo = recipesRepo {
    fetchRecipes(categoryId);
  }

  final int categoryId;
  List<RecipesModel> elements = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchRecipes(int categoryId) async {
    isLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getAll(queryParam: {'Category':categoryId});

    result.fold(
      (exception) {
        print('Error fetching recipes: $error');
        return error = exception.toString();
      },

      (value) {
        print('Fetched ${elements.length} recipes: $elements');
        return elements = value;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
