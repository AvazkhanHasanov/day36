import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/category/detail_model.dart';

class DetailRepository {
  final ApiClient _client;

  DetailRepository({required ApiClient client}) : _client = client;

  Future<Result<DetailModel>> getById(Map<String,dynamic>? queryParams) async {
    final response = await _client.get('/recipes/detail',queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(DetailModel.fromJson(value)
      ),
    );
  }
}
