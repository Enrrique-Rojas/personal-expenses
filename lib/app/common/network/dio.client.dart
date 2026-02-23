import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:personal_expenses/app/common/configs/configuration.dart';
import 'package:personal_expenses/app/common/constants/local_storage.const.dart';
import 'package:personal_expenses/app/common/utils/DIO.util.dart';
import 'package:personal_expenses/app/infrastructure/datasources/storage/local.storage.dart';

class DioClient {
  late Dio _dio;
  late String host;
  final LocalStorage storage;

  DioClient({required this.storage}) {
    host = Configuration.host;
    _dio = Dio(BaseOptions(baseUrl: host));
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (options.extra['isAuthCall'] != true) {
          final token = await storage.getStorage(LocalStorageConstants.token);
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
        }
        options.extra['startTime'] = DateTime.now().millisecondsSinceEpoch;
        return handler.next(options);
      },
      onResponse: (response, handler) {
        final startTime = response.requestOptions.extra['startTime'] as int;
        final endTime = DateTime.now().millisecondsSinceEpoch;
        final durationInSeconds = (endTime - startTime) / 1000;
        if (kDebugMode) {
          if (response.statusCode == 200) {
            print(
                "Api: ${response.requestOptions.method} ${response.requestOptions.path}");
            print("Duration: ${durationInSeconds.toStringAsFixed(2)}s");
          }
        }

        return handler.next(response);
      },
      onError: (DioException e, handler) {
        if (kDebugMode) {
          final startTime = e.requestOptions.extra['startTime'] as int;
          final endTime = DateTime.now().millisecondsSinceEpoch;
          final durationInSeconds = (endTime - startTime) / 1000;
          print("======================= ERROR API ========================");
          print("Host: ${e.requestOptions.baseUrl}");
          print("Method: ${e.requestOptions.method}");
          print("Path: ${e.requestOptions.path}");
          print("Body: ${e.response?.data.toString()}");
          print("${e.response?.statusCode}: ${e.message}");
          print("Duration: ${durationInSeconds.toStringAsFixed(2)}s");
          print("==========================================================");
        }
        return handler.next(e);
      },
    ));
  }

  Future<dynamic> get(String path) async {
    try {
      final response = await _dio.get(path);
      return DioUtil.getDioResponse(response);
    } on DioException catch (e) {
      throw DioUtil.handleDioError(e);
    }
  }

  Future<dynamic> post(String path, dynamic data,
      {bool isAuthCall = false}) async {
    try {
      final response = await _dio.post(path,
          data: data, options: Options(extra: {'isAuthCall': isAuthCall}));
      final result = DioUtil.getDioResponse(response);
      return result;
    } on DioException catch (e) {
      throw DioUtil.handleDioError(e);
    }
  }

  Future<dynamic> put(String path, dynamic data) async {
    try {
      final response = await _dio.put(path, data: data);
      return DioUtil.getDioResponse(response);
    } on DioException catch (e) {
      throw DioUtil.handleDioError(e);
    }
  }

  Future<dynamic> patch(String path, dynamic data) async {
    try {
      final response = await _dio.patch(path, data: data);
      return DioUtil.getDioResponse(response);
    } on DioException catch (e) {
      throw DioUtil.handleDioError(e);
    }
  }

  Future<dynamic> delete(String path, {dynamic data}) async {
    try {
      final response = await _dio.delete(path, data: data);
      return DioUtil.getDioResponse(response);
    } on DioException catch (e) {
      throw DioUtil.handleDioError(e);
    }
  }
}
