import 'package:dio/dio.dart';
import 'package:student_hub/core/logger/logger.dart';


class NetworkManager {
  static late Dio dio;
  Future<Dio> initDio() async {
    try {
      dio = Dio(
        BaseOptions(
          baseUrl: '',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          contentType: 'application/json',
          headers: {
            'Accept': 'application/json',
          },
          receiveDataWhenStatusError: true,
        )
      );
      return dio;
    } on DioException catch (e) {
      rethrow;
    }
  }

  void updateHeader({String? accessToken}) {
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }

  void configInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Do something before request is sent
    logger.v('REQUEST[${options.method}] => PATH: ${options.path}');
    logger.v('REQUEST[${options.method}] => HEADER: ${options.headers}');
    logger.v('REQUEST[${options.method}] => DATA: ${options.data}');
    logger
        .v('REQUEST[${options.method}] => QUERY PARAMS: ${options.queryParameters}');
    //full url
    logger.v('REQUEST[${options.method}] => FULL URL: ${options.uri}');
    return handler.next(options); //continue
  }

  Future<void> _onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    // Do something with response data
    logger.v('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    logger.v('RESPONSE[${response.statusCode}] => HEADER: ${response.headers}');
    logger.v('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
    return handler.next(response); // continue
  }

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    // Do something with response error
    logger.e(
        'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
    logger.e(
        'ERROR[${error.response?.statusCode}] => HEADER: ${error.response?.headers}');
    logger.e('ERROR[${error.response?.statusCode}] => DATA: ${error.response?.data}');
    return handler.reject(error); //continue
  }

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        ProgressCallback? onReceiveProgress,
      }) async {
    return dio.get(path,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        Map<String, dynamic>? headers,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    return dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {...dio.options.headers, ...headers ?? {}}),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }
}