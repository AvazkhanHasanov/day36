import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/utils/result.dart';
import 'package:day_36_darsda1/data/models/onboarding/onboarding_model.dart';

class OnboardingRepository {
  final ApiClient _client;

  OnboardingRepository({required ApiClient client}) : _client = client;

  Future<Result<List<OnboardingModel>>> getAll() async {
    final respond = await _client.get<List>('/onboarding/list');
    return respond.fold(
      (error) => Result.error(error),
      (success) => Result.ok(success.map((x) => OnboardingModel.fromJson(x)).toList()),
    );
  }
}
