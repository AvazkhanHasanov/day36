import 'package:day_36_darsda1/data/models/recipes/detail_model.dart';
import 'package:day_36_darsda1/data/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class RecipesDetailViewModel extends ChangeNotifier {
  final RecipeRepository _recipesRepo;

  RecipesDetailViewModel({required int detailId, required RecipeRepository recipesRepo})
    : _recipesRepo = recipesRepo{
    fetchDetail(detailId: detailId);
  }
  String? error;
  RecipesDetailModel? detail;
  bool isLoading = true;

  Future<void> fetchDetail({required int detailId}) async {
    isLoading = true;
    notifyListeners();
    final result = await _recipesRepo.getById(detailId);
    result.fold((e) => error = e.toString(), (value) => detail = value);
    isLoading = false;
    notifyListeners();
  }
}
