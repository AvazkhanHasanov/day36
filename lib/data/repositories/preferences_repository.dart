import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/utils/result.dart';
import 'package:day_36_darsda1/data/models/onboarding/preferences_model.dart';

class PreferencesRepository {
  final ApiClient _client;

  PreferencesRepository({required ApiClient client}) : _client = client;

  Future<Result<List<PreferenceModel>>> getAll() async {
    var response = await _client.get<List>('/cuisines/list');
    return response.fold(
      (error) => Result.error(error),
      (success) => Result.ok(success.map((x) => PreferenceModel.fromJson(x)).toList()),
    );
  }
}
