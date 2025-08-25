import 'package:day_36_darsda1/data/models/recipes/recipes_review_model.dart';
import 'package:day_36_darsda1/data/repositories/recipe_repository.dart';
import 'package:flutter/cupertino.dart';

class RecipesReviewViewModel extends ChangeNotifier {
  final RecipeRepository _recipesRepo;

  RecipesReviewViewModel({required int id, required RecipeRepository recipesRepo}) : _recipesRepo = recipesRepo {
    fetchRecipesReview(id);
  }

  bool isReviewLoading = false;
  String? reviewError;
  RecipesReviewModel? recipesReview;

  Future<void> fetchRecipesReview(int id) async {
    isReviewLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getRecipeReview(id: id);
    result.fold((exception) => reviewError = exception.toString(), (value) => recipesReview = value);
    isReviewLoading = false;
    notifyListeners();
  }
}
