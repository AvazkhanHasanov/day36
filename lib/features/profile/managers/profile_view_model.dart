import 'package:day_36_darsda1/data/models/chef_profile_model.dart';
import 'package:day_36_darsda1/data/models/recipes/recipes_model.dart';
import 'package:day_36_darsda1/data/repositories/auth_repository.dart';
import 'package:day_36_darsda1/data/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  final AuthRepository _authRepo;
  final RecipeRepository _recipeRepo;

  ProfileViewModel({
    required AuthRepository authRepo,
    required RecipeRepository recipesRepo,
  }) : _authRepo = authRepo,
       _recipeRepo = recipesRepo {
    _init();
  }

  Future<void> _init() async {
    await fetchProfile();
    await fetchRecipes();
  }

  bool isProfileLoading = true;
  String? profileError;
  ChefProfileModel? profile;

  Future<void> fetchProfile() async {
    isProfileLoading = true;
    notifyListeners();
    var result = await _authRepo.getProfile();
    result.fold(
      (exception) => profileError = exception.toString(),
      (value) => profile = value,
    );
    isProfileLoading = false;
    notifyListeners();
  }

  //recipe
  bool isRecipesLoading = true;
  String? recipesError;
  List<RecipesModel>? recipes;

  Future<void> fetchRecipes() async {
    isRecipesLoading = true;
    notifyListeners();
    var result = await _recipeRepo.getAll(queryParam: {'UserId': profile!.id});
    result.fold(
      (exception) => recipesError = exception.toString(),
      (value) => recipes = value,
    );
    isRecipesLoading = false;
    notifyListeners();
  }
}
