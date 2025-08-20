import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/recipes/recipes_model.dart';

class RecipesRepository {
  final ApiClient _client;

  RecipesRepository({required ApiClient client}) : _client = client;

  Future<Result<List<RecipesModel>>> getAll({Map<String,dynamic>? queryParam}) async {

    final response = await _client.get<List>('/recipes/list',queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => RecipesModel.fromJson(x)).toList(),
      ),
    );
  } Future<Result<List<RecipesModel>>> getRecipeDetail({Map<String,dynamic>? queryParam}) async {

    final response = await _client.get<List>('/recipes/list',queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => RecipesModel.fromJson(x)).toList(),
      ),
    );
  } Future<Result<List<RecipesModel>>> getRecipeReview({Map<String,dynamic>? queryParam}) async {

    final response = await _client.get<List>('/recipes/list',queryParams: queryParam);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => RecipesModel.fromJson(x)).toList(),
      ),
    );
  }



}
