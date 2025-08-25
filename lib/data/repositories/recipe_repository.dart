import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/utils/result.dart';
import 'package:day_36_darsda1/data/models/recipes/community_recipes_model.dart';
import 'package:day_36_darsda1/data/models/recipes/recipes_create_review_model.dart';
import 'package:day_36_darsda1/data/models/recipes/my_recipes_model.dart';
import 'package:day_36_darsda1/data/models/recipes/recipes_model.dart';
import 'package:day_36_darsda1/data/models/recipes/recipes_review_model.dart';

import '../models/recipes/detail_model.dart';
import '../models/trending_model.dart';

class RecipeRepository {
  final ApiClient _client;

  RecipeRepository({required ApiClient client}) : _client = client;

  Future<Result<List<RecipesModel>>> getAll({Map<String, dynamic>? queryParam}) async {
    final response = await _client.get<List>('/recipes/list', queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => RecipesModel.fromJson(x)).toList(),
      ),
    );
  }

  Future<Result<RecipesDetailModel>> getById(int id, {Map<String, dynamic>? queryParams}) async {
    final response = await _client.get('/recipes/detail/$id', queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(RecipesDetailModel.fromJson(value)),
    );
  }

  Future<Result<RecipesReviewModel>> getRecipeReview({required int id, Map<String, dynamic>? queryParam}) async {
    final response = await _client.get<Map<String, dynamic>>('/recipes/reviews/detail/$id', queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        RecipesReviewModel.fromJson(value),
      ),
    );
  }

  Future<Result<RecipesCreateReviewModel>> getCreateReview({required int id, Map<String, dynamic>? queryParam}) async {
    final response = await _client.get<Map<String, dynamic>>('/recipes/create-review/$id', queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        RecipesCreateReviewModel.formJson(value),
      ),
    );
  }

  Future<Result<List<CommunityRecipesModel>>> getCommunityAll({Map<String, dynamic>? queryParam}) async {
    final response = await _client.get<List>('/recipes/community/list', queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),

      (success) => Result.ok(success.map((x) => CommunityRecipesModel.fromJson(x)).toList()),
    );
  }

  Future<Result<List<MyRecipesModel>>> getMyRecipes({Map<String, dynamic>? queryParam}) async {
    final response = await _client.get<List>('/recipes/my-recipes', queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (success) => Result.ok(success.map((x) => MyRecipesModel.fromJson(x)).toList()),
    );
  }

  Future<Result<TrendingModel>> getTrendingRecipe() async {
    final result = await _client.get<Map<String, dynamic>>('/recipes/trending-recipe');
    return result.fold(
      (error) => Result.error(error),
      (success) => Result.ok(TrendingModel.fromJson(success)),
    );
  }
}
