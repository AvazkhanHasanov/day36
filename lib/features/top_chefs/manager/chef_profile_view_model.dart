import 'package:day_36_darsda1/data/models/recipes/recipes_model.dart';
import 'package:day_36_darsda1/data/models/chef_profile_model.dart';
import 'package:day_36_darsda1/data/repositories/chef_repository.dart';
import 'package:day_36_darsda1/data/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class ChefProfileViewModel extends ChangeNotifier {
  final ChefRepository _chefProfileRepo;
  final RecipeRepository _recipesRepo;

  ChefProfileViewModel({
    required ChefRepository chefProfileRepo,
    required int id,
    required RecipeRepository recipesRepo,
  }) : _chefProfileRepo = chefProfileRepo,
       _recipesRepo = recipesRepo {
    fetchChefProfile(id);
    fetchRecipes(id);
  }

  bool isProfileLoading = false;
  String? chefProfileError;
  ChefProfileModel? chefProfile;

  Future<void> fetchChefProfile(int id) async {
    isProfileLoading = true;
    notifyListeners();

    var result = await _chefProfileRepo.getById(id);
    result.fold(
      (exception) => chefProfileError = exception.toString(),
      (value) => chefProfile = value,
    );
    isProfileLoading = false;
    notifyListeners();
  }

  //

  bool isRecipesLoading = false;
  String? recipesError;
  List<RecipesModel>? recipes;

  Future<void> fetchRecipes(int id) async {
    isRecipesLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getAll(queryParam: {'UserId': id});
    result.fold(
      (exception) {
        recipesError = exception.toString();
        recipes = null;
      },
      (value) {
        recipesError = null;
        recipes = value;
      },
    );
    isRecipesLoading = false;
    notifyListeners();
  }
}
