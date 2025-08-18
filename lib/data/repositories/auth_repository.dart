import 'package:day_36_darsda1/core/client.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/data/models/auth/auth_model.dart';
import 'package:day_36_darsda1/data/models/auth/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final ApiClient _client;
  final FlutterSecureStorage _secureStorage;

  AuthRepository({
    required FlutterSecureStorage secureStorage,
    required ApiClient client,
  }) : _client = client,
       _secureStorage = secureStorage;

  Future<Result<String>> add({required AuthModel authData}) async {
    final result = await _client.post(
      '/auth/register',
      data: authData.toJson(),
    );
    return result.fold(
      (error) => Result.error(error),
      (value) {
        return Result.ok(value['accessToken']);
      },
    );
  }

  Future<Result<String>> login({required LoginModel loginData}) async {
    final result = await _client.post<Map<String, dynamic>>(
      '/auth/login',
      data: loginData.toJson(),
    );
    return result.fold((error) => Result.error(error), (value) {
      final token = value['accessToken'];
      _secureStorage.write(key: 'token', value: token);
      return Result.ok(token);
    });
  }
}
