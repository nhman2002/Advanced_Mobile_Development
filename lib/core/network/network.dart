import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:student_hub/common/config/navigation_event.dart';
import 'package:student_hub/core/local_notifications/notification_service.dart';
import 'package:student_hub/core/logger/logger.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class NetworkManager {
  NetworkManager.initial() {
    init();
  }

  final LocalStorage _localStorage = LocalStorage.instance;
  final Dio _dio = Dio();

  static const int connectTimeout = 60000;
  static const int receiveTimeout = 60000;

  String baseUrl = 'https://api.studenthub.dev/api';
  String _accessToken = '';
  // String _refreshToken = '';



  Future<void> init() async {
    print('init network manager');
    _accessToken = _localStorage.getString(key: StorageKey.accessToken) ?? '';
    // _refreshToken = _localStorage.getString(key: StorageKey.refreshToken) ?? '';

    final dioOption = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: connectTimeout),
        receiveTimeout: const Duration(milliseconds: receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_accessToken',
        });

    _dio.options = dioOption;

    configInterceptors();
  }

  void updateHeader({String? accessToken}) {
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }

  void configInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
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
    logger.v(
        'REQUEST[${options.method}] => QUERY PARAMS: ${options.queryParameters}');
    //full url
    logger.v('REQUEST[${options.method}] => FULL URL: ${options.uri}');
    return handler.next(options); //continue
  }

  Future<void> _onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    // Do something with response data
    logger.v(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
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
    logger.e(
        'ERROR[${error.response?.statusCode}] => DATA: ${error.response?.data}');
    return handler.reject(error); //continue
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
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
    return _dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {..._dio.options.headers, ...headers ?? {}}),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.put(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {..._dio.options.headers, ...headers ?? {}}),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response> putFile(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    FormData formData =
        FormData.fromMap({'file': await MultipartFile.fromFile(data)});

    return _dio.put(
      path,
      data: formData,
      queryParameters: queryParameters,
      options: Options(headers: {..._dio.options.headers, ...headers ?? {}}),
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: {..._dio.options.headers, ...headers ?? {}}),
    );
  }

  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.patch(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {..._dio.options.headers, ...headers ?? {}}),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }
}
