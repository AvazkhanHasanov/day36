import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/trending_model.dart';

class TrendingRepository {
  final ApiClient _client;

  TrendingRepository({required ApiClient client}) : _client = client;

  Future<Result<TrendingModel>> getOne() async {
    final result = await _client.get<Map>('/recipes/trending-recipe');
    return result.fold((error) => Result.error(error), (success) {
      return Result.ok(TrendingModel.fromJson(success as Map<String, dynamic>));
    });
  }
}
