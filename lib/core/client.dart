import 'package:day_36_darsda1/core/result/result.dart';
import 'package:dio/dio.dart';

var dio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.253.226:8888/api/v1',
    validateStatus: (status) => true,
  ),
);

class ApiClient {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.253.226:8888/api/v1',
      validateStatus: (status) => true,
    ),
  );

  Future<Result<T>> post<T>(String path, Object? data) async {
    var response = await dio.post(path, data: data);
    if (response.statusCode! > 300 && response.statusCode! < 200) {
      return Result.error(Exception(response.data));
    } else {
      return Result.ok(response.data);
    }
  }

  Future<Result<T>> get<T>(String path) async {
    var response = await dio.get(path);
    if (response.statusCode!=200) {
      return Result.error(Exception(response.data));
    } else {
      return Result.ok(response.data as T);
    }
  }
}
