import 'package:day_36_darsda1/core/routing/router.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'routing/routes.dart';


class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.secureStorage,
  });

  final FlutterSecureStorage secureStorage;
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://10.225.190.75:8888/api/v1",
      validateStatus: (status) => true,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print('Request Ketti $options, $handler');
    var token = await secureStorage.read(key: 'token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print('Response keldii: $response, $handler,');
    if (response.statusCode == 401) {
      var login = await secureStorage.read(key: 'login');
      var password = await secureStorage.read(key: 'password');
      if (login == null || password == null) await logout();

      var result = await dio.post('/auth/login', data: {'login': login, 'password': password});
      String? token = result.data['accessToken'];

      if (result.statusCode != 200 || token == null) await logout();

      await secureStorage.write(key: 'token', value: token);
      final headers = response.requestOptions.headers;
      headers['Authorization'] = 'Bearer $token';

      var retry = await dio.fetch(
        RequestOptions(
          baseUrl: response.requestOptions.baseUrl,
          path: response.requestOptions.path,
          method: response.requestOptions.method,
          headers: headers,
        ),
      );
      super.onResponse(retry, handler);
    } else {
      super.onResponse(response, handler);
    }
  }

  Future<void> logout() async {
    await secureStorage.delete(key: 'token');
    await secureStorage.delete(key: 'login');
    await secureStorage.delete(key: 'password');
    router.go(Routes.login);
    return;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('errooooooooooooooooor: $err, $handler');
    super.onError(err, handler);
  }
}
