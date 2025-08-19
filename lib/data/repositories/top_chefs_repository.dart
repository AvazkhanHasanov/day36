import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/top_chefs_model.dart';

class TopChefsRepository {
  final ApiClient _client;

  TopChefsRepository({required ApiClient client}) : _client = client;

  Future<Result<List<TopChefsModel>>> getAll({Map<String, dynamic>? queryParams}) async {
    var response = await _client.get<List>('/top-chefs/list', queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (success) =>
          Result.ok(success.map((x) => TopChefsModel.fromJson(x)).toList()),
    );
  }
}
