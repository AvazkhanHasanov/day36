import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/utils/result.dart';
import 'package:day_36_darsda1/data/models/chef_profile_model.dart';

import '../models/top_chefs_model.dart';

class ChefRepository {
  final ApiClient _client;

  ChefRepository({required ApiClient client}) : _client = client;

  Future<Result<ChefProfileModel>> getById(int id) async {
    var respond = await _client.get('/auth/details/$id');
    return respond.fold(
      (error) {
        return Result.error(error);
      },
      (success) {
        return Result.ok(ChefProfileModel.fromJson(success));
      },
    );
  }

  Future<Result<List<TopChefsModel>>> getAll({Map<String, dynamic>? queryParams}) async {
    var response = await _client.get<List>('/top-chefs/list', queryParams: queryParams);
    return response.fold(
          (error) => Result.error(error),
          (success) =>
          Result.ok(success.map((x) => TopChefsModel.fromJson(x)).toList()),
    );
  }
}
