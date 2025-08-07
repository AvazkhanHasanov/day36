import 'package:dio/dio.dart';

var dio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.135.102:8888/api/v1',
    validateStatus: (status) => true,
  ),
);
