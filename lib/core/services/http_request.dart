import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {

  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: HttpConfig.timeOut,
  );

  static final Dio _dio = Dio(_baseOptions);

  static final List<Interceptor> interceptors = <Interceptor>[
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print('onRequest URL ===> ${options.uri}');
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print('onResponse');
        return handler.next(response);
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        print('onError');
        return handler.next(error);
      }
    )
  ];

  static Future<T> request<T>(String url, {
    String method = 'get', Map<String, dynamic>? params, Map<String, dynamic>? headers, Interceptor? inter}) async {

    if (inter != null) {
      interceptors.add(inter);
    }
    _dio.interceptors.addAll(interceptors);

    final Options options = Options(method: method, headers: headers,);

    try {
      Response response = await _dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}