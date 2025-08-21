import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor{
@override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request Ketti $options, $handler');
    super.onRequest(options, handler);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response keldii: $response, $handler,');
    super.onResponse(response, handler);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('errooooooooooooooooor: $err, $handler');
    super.onError(err, handler);
  }
}

