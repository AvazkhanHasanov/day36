import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/category/recipes_model.dart';

class RecipesRepository {
  final ApiClient _client;
  List<RecipesModel> recipes = [];

  RecipesRepository({required ApiClient client}) : _client = client;

  Future<Result<List<RecipesModel>>> getAll(int id) async {
    final response = await _client.get<List>('/recipes/list?Category=$id');
    print('API response raw: $response');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        recipes = value.map((x) => RecipesModel.fromJson(x)).toList(),
      ),
    );
  }
}
