import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/auth/auth_model.dart';
import 'package:day_36_darsda1/data/models/auth/login_model.dart';

class AuthRepository {
  final ApiClient _client;

  AuthRepository({required ApiClient client}) : _client = client;

  Future<Result<String>> add({required AuthModel authData}) async {
    final result = await _client.post(
      '/auth/register',
      data: authData.toJson(),
    );
    return result.fold(
      (error) => Result.error(error),
      (value) {
        final token = value['accessToken'] as String;

        return Result.ok(token);
      },
    );
  }

  Future<Result<String>> login({required LoginModel loginData}) async {
    final result = await _client.post<Map<String, dynamic>>(
      '/auth/login',
      data: loginData.toJson(),
    );
    return result.fold((error) => Result.error(error), (value) {
      final token = value['accessToken'] as String;
      return Result.ok(token);
    });
  }
}
