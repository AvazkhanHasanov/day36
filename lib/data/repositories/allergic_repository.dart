import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/utils/result.dart';
import 'package:day_36_darsda1/data/models/onboarding/allergic_model.dart';

class AllergicRepository {
  final ApiClient _client;

  AllergicRepository({required ApiClient client}) : _client = client;

  Future<Result<List<AllergicModel>>> getAll() async {
    final response = await _client.get<List>('/allergic/list');
    return response.fold(
      (error) => Result.error(error),
      (value) =>
          Result.ok(value.map((x) => AllergicModel.fromJson(x)).toList()),
    );
  }
}
