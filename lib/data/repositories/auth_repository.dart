import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/auth/auth_model.dart';

class AuthRepository {
  final ApiClient client;

  AuthRepository({required this.client});

  // final AuthRepository _authRepo;
  Future<Result<String>> register({required AuthModel authData}) async {
    final result = await client.post('auth/register', authData.toJson());
    return result.fold(
      (error) {
        return Result.error(error);
      },
      (success) {
        return Result.ok(success['accessToken']?.toString()??'');
      },
    );
  }
}
