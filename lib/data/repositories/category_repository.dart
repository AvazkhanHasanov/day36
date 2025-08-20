import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/recipes/category_model.dart';

class CategoryRepository {
  final ApiClient _client;

  CategoryRepository({required ApiClient client}) : _client = client;

  Future<Result<List<CategoriesModel>>> getAll() async {
    final result = await _client.get<List>('/categories/list');
    return result.fold(
      (error) => Result.error(error),
      (value) =>
          Result.ok(value.map((x) => CategoriesModel.fromJson(x)).toList()),
    );
  }
}
