import 'package:day_36_darsda1/data/models/recipes/recipes_create_review_model.dart';
import 'package:day_36_darsda1/data/repositories/recipe_repository.dart';
import 'package:flutter/cupertino.dart';

class CreateReviewViewModel extends ChangeNotifier {
  final RecipeRepository _recipesRepo;

  CreateReviewViewModel({required int id, required RecipeRepository recipesRepo}) : _recipesRepo = recipesRepo {
    fetchRecipesReview(id);
  }

  bool isCreateReviewLoading = false;
  String? createReviewError;
  RecipesCreateReviewModel? createdReview;

  Future<void> fetchRecipesReview(int id) async {
    isCreateReviewLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getCreateReview(id: id);
    result.fold((exception) => createReviewError = exception.toString(), (value) => createdReview = value);
    isCreateReviewLoading = false;
    notifyListeners();
  }
}
