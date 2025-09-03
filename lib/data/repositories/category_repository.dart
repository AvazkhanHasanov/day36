import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/utils/result.dart';
import 'package:day_36_darsda1/data/models/recipes/category_model.dart';
import 'package:hive_flutter/adapters.dart';

class CategoryRepository {
  final ApiClient _client;
  static final String _box = 'category';

  CategoryRepository({required ApiClient client}) : _client = client;

  Future<Result<List<CategoriesModel>>> getAll({Map<String, dynamic>? queryParams}) async {
    final response = await _client.get<List>('/categories/list', queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (value) async {
        final categories = value.map((x) => CategoriesModel.fromJson(x)).toList();
        final box = await Hive.openBox<CategoriesModel>(_box);
        await box.clear();
        for (var category in categories) {
          await box.put(category.id, category);
        }
        return Result.ok(categories);
      },
    );
  }

  Future<List<CategoriesModel>> getLocal() async {
    final box = await Hive.openBox<CategoriesModel>(_box);
    return box.values.toList();
  }
}
