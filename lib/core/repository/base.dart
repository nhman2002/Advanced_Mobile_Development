import 'dart:convert';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/error_model.dart';
import 'package:student_hub/core/network/network.dart';

typedef ParseJsonFunction<OutputType> = OutputType Function(
    Map<String, dynamic> jsonData);

GetIt getIt = GetIt.instance;

class BaseRepository {
  late NetworkManager _networkManager;
  final String serviceName;

  BaseRepository(this.serviceName) {
    _networkManager = getIt<NetworkManager>();
  }

  Future<T> get<T>(
      {required String path,
        required ParseJsonFunction<T> parseJsonFunction,
        Map<String, dynamic>? queryParameters}) async {
    final response = await _networkManager.get(serviceName + path,
        queryParameters: queryParameters);

    try {
      if (response.statusCode == 200) {
        final parser = ResultParser<T>(
            response.data as Map<String, dynamic>? ?? {}, parseJsonFunction);
        return parser.parseInBackground();
      } else {
        final parser = ResultParser<ErrorModel>(
            response.data as Map<String, dynamic>? ?? {}, ErrorModel.fromJson);
        throw Exception((await parser.parseInBackground()).message);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  Future<T> post<T>(
      {required String path,
        required ParseJsonFunction<T> parseJsonFunction,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? data}) async {
    final response = await _networkManager.post(serviceName + path,
        queryParameters: queryParameters, data: data, headers: headers);

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final parser = ResultParser<T>(
            response.data as Map<String, dynamic>? ?? {}, parseJsonFunction);
        return parser.parseInBackground();
      } else {
        final parser = ResultParser<ErrorModel>(
            response.data as Map<String, dynamic>? ?? {}, ErrorModel.fromJson);
        throw Exception((await parser.parseInBackground()).message);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }
}

class ResultParser<OutputType> {
  ResultParser(this.json, this.parseJsonFunction);
  final Map<String, dynamic> json;
  final ParseJsonFunction<OutputType> parseJsonFunction;

  Future<OutputType> parseInBackground() async {
    // final completer = Completer<OutputType>();
    final receivePort = ReceivePort();
    final errorPort = ReceivePort()
      ..listen((message) {
        throw Exception(message);
      });
    await Isolate.spawn(_decodeAndParseJson, receivePort.sendPort,
        onError: errorPort.sendPort);

    return await receivePort.first as OutputType;
  }

  Future<void> _decodeAndParseJson(SendPort sendPort) async {
    final output = parseJsonFunction.call(json);
    sendPort.send(output);
    try {
      final output = parseJsonFunction.call(json);
      sendPort.send(output);
    } catch (exception) {
      sendPort.send(exception);
    }
    Isolate.exit();
  }
}