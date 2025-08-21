import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/recipes/create_review_model.dart';
import 'package:day_36_darsda1/data/models/recipes/recipes_model.dart';
import 'package:day_36_darsda1/data/models/recipes/recipes_review_model.dart';

class RecipesRepository {
  final ApiClient _client;

  RecipesRepository({required ApiClient client}) : _client = client;

  Future<Result<List<RecipesModel>>> getAll({Map<String, dynamic>? queryParam}) async {
    final response = await _client.get<List>('/recipes/list', queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => RecipesModel.fromJson(x)).toList(),
      ),
    );
  }

  Future<Result<List<RecipesModel>>> getRecipeDetail({Map<String, dynamic>? queryParam}) async {
    final response = await _client.get<List>('/recipes/list', queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => RecipesModel.fromJson(x)).toList(),
      ),
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

  Future<Result<CreateReviewModel>> getCreateReview({required int id, Map<String, dynamic>? queryParam}) async {
    final response = await _client.get<Map<String, dynamic>>('/recipes/create-review/$id', queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        CreateReviewModel.formJson(value),
      ),
    );
  }
}
