import 'package:day_36_darsda1/data/models/recipes/create_review_model.dart';
import 'package:day_36_darsda1/data/repositories/recipes_repository.dart';
import 'package:flutter/cupertino.dart';

class CreateReviewViewModel extends ChangeNotifier {
  final RecipesRepository _recipesRepo;

  CreateReviewViewModel({required int id, required RecipesRepository recipesRepo}) : _recipesRepo = recipesRepo {
    fetchRecipesReview(id);
  }

  bool isCreateReviewLoading = false;
  String? createReviewError;
  CreateReviewModel? createdReview;

  Future<void> fetchRecipesReview(int id) async {
    isCreateReviewLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getCreateReview(id: id);
    result.fold((exception) => createReviewError = exception.toString(), (value) => createdReview = value);
    isCreateReviewLoading = false;
    notifyListeners();
  }
}
