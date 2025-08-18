import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/category/recipes_model.dart';

class RecipesRepository {
  final ApiClient _client;

  RecipesRepository({required ApiClient client}) : _client = client;

  Future<Result<List<RecipesModel>>> getAll({int? id}) async {
    final endPoint = id != null
        ? '/recipes/list?Category=$id'
        : '/recipes/list?Limit=2';
    final response = await _client.get<List>(endPoint);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(
        value.map((x) => RecipesModel.fromJson(x)).toList(),
      ),
    );
  }
}
