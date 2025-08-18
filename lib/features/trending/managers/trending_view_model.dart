import 'package:day_36_darsda1/data/models/category/recipes_model.dart';
import 'package:day_36_darsda1/data/models/trending_model.dart';
import 'package:day_36_darsda1/data/repositories/recipes_repository.dart';
import 'package:day_36_darsda1/data/repositories/trending_repository.dart';
import 'package:flutter/material.dart';

class TrendingViewModel extends ChangeNotifier {
  final TrendingRepository _trendingRepo;
  final RecipesRepository _recipesRepo;

  TrendingViewModel({
    required this.categoryId,
    required RecipesRepository recipesRepo,
    required TrendingRepository trendingRepo,
  }) : _trendingRepo = trendingRepo,
       _recipesRepo = recipesRepo {
    fetchTrending();
    fetchRecipes(categoryId);
  }

  final int categoryId;
  TrendingModel? trending;

  bool isTrendingLoading = true;
  String? error;

  Future<void> fetchTrending() async {
    isTrendingLoading = true;
    notifyListeners();
    var result = await _trendingRepo.getOne();
    result.fold(
      (exception) => error = exception.toString(),
      (value) => trending = value,
    );
    isTrendingLoading = false;
    notifyListeners();
  }

  bool isRecipesLoading = false;
  String? recipesError;
  List<RecipesModel> recipes = [];

  Future<void> fetchRecipes(int categoryId) async {
    isRecipesLoading = true;
    notifyListeners();
    var result = await _recipesRepo.getAll(id: categoryId);
    result.fold(
      (exception) => recipesError = exception.toString(),
      (value) => recipes = value,
    );
    isRecipesLoading = false;
    notifyListeners();
  }
}
