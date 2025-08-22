import 'package:day_36_darsda1/core/auth_interceptor/auth_interceptor.dart';
import 'package:day_36_darsda1/core/result/result.dart';
import 'package:day_36_darsda1/core/route/route_name.dart';
import 'package:day_36_darsda1/core/route/router.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  final FlutterSecureStorage _secureStorage;

  ApiClient({required FlutterSecureStorage secureStorage}) : _secureStorage = secureStorage {
   _dio= Dio(
      BaseOptions(
        baseUrl: "http://192.168.253.143:8888/api/v1",
        validateStatus: (status) => true,
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    _dio.interceptors.add(AuthInterceptor());
  }

  late final Dio _dio;

  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    var token = await _secureStorage.read(key: 'token');
    try {
      var response = await _dio.get(
        path,
        queryParameters: queryParams,
        options: Options(
          headers: token != null ? {'Authorization': "Bearer $token"} : null,
        ),
      );
      if (response.statusCode == 401) {
        await _secureStorage.delete(key: 'token');
        router.go(RouteName.login);
      }
      if (response.statusCode != 200) {
        return Result.error(Exception(response.data));
      }
      return Result.ok(response.data as T);
    } on Exception catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result<T>> post<T>(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    var token = await _secureStorage.read(key: 'token');

    try {
      var response = await _dio.post(
        path,
        data: data,
        options: Options(
          headers: token != null ? {'Autohorization': "Bearer $token"} : null,
        ),
      );
      if (response.statusCode == 401) {
        await _secureStorage.delete(key: 'token');
        router.go(RouteName.login);
      }
      if (response.statusCode != 200 && response.statusCode != 201) {
        return Result.error(Exception('hatolik ${response.data}'));
      }
      return Result.ok(response.data as T);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<T>> patch<T>(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    var token = await _secureStorage.read(key: 'token');

    try {
      var response = await _dio.patch(
        path,
        data: data,
        options: Options(
          headers: token != null ? {'Autohorization': "Bearer $token"} : null,
        ),
      );
      if (response.statusCode != 200) {
        return Result.error(response.data);
      }
      return Result.ok(response.data as T);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> delete(String path) async {
    var token = await _secureStorage.read(key: 'token');

    try {
      var response = await _dio.delete(
        path,
        options: Options(
          headers: token != null ? {'Autohorization': "Bearer $token"} : null,
        ),
      );
      if (response.statusCode != 204) {
        return Result.error(response.data);
      }
      return Result.ok(response.data);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
