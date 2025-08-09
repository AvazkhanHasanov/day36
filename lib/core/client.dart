import 'package:dio/dio.dart';

var dio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.135.92:8888/api/v1',
    validateStatus: (status) => true,
  ),
);
