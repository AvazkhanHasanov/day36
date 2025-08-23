import 'package:day_36_darsda1/data/models/recipes/my_recipes_model.dart';
import 'package:day_36_darsda1/data/repositories/recipes_repository.dart';
import 'package:flutter/cupertino.dart';

class MyRecipesViewModel extends ChangeNotifier {
  final RecipesRepository _recipesRepo;

  MyRecipesViewModel({required RecipesRepository recipesRepo}) : _recipesRepo = recipesRepo {
    fetch2My();
    fetchMy();
  }

  String? myRecipesError;
  bool isLoadingMy = false;
  List<MyRecipesModel> my = [];

  Future<void> fetchMy() async {
    isLoadingMy = true;
    notifyListeners();
    var result = await _recipesRepo.getMyRecipes();
    result.fold((exception) => myRecipesError = exception.toString(), (value) => my = value);
    isLoadingMy = false;
    notifyListeners();
  }

  String? my2RecipesError;
  bool is2LoadingMy = false;
  List<MyRecipesModel> my2 = [];

  Future<void> fetch2My() async {
    is2LoadingMy = true;
    notifyListeners();
    var result = await _recipesRepo.getMyRecipes(queryParam: {'Limit': 2});
    result.fold((exception) => my2RecipesError = exception.toString(), (value) => my2 = value);
    is2LoadingMy = false;
    notifyListeners();
  }
}
