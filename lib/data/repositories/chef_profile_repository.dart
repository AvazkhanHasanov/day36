import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/chef_profile_model.dart';

class ChefProfileRepository {
  final ApiClient _client;

  ChefProfileRepository({required ApiClient client}) : _client = client;

  Future<Result<ChefProfileModel>> getAll(int id) async {
    var respond = await _client.get('/auth/details/$id');
    return respond.fold(
      (error) {
        print('errorrrrrrrrrrr: $error');
        return Result.error(error);
      },
      (success) {
        print('nays: $success');
        return Result.ok(ChefProfileModel.fromJson(success));
      },
    );
  }
}
