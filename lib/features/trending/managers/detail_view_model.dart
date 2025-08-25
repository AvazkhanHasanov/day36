import 'package:day_36_darsda1/data/repositories/recipe_repository.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/models/recipes/detail_model.dart';



class DetailIdViewModel extends ChangeNotifier {
  final RecipeRepository _recipesRepo;

  DetailIdViewModel({
    required RecipeRepository recipesRepo,
    required int detailId,
  }) : _recipesRepo = recipesRepo {
    fetchDetail(id: detailId);
  }

  bool isDetailLoading = false;
  String? detailError;
  RecipesDetailModel? recipes;

  Future<void> fetchDetail({required int id}) async {
    isDetailLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getById(id);
    result.fold(
          (exception) => detailError = exception.toString(),
          (value) => recipes = value,
    );
    isDetailLoading = false;
    notifyListeners();
  }
}
