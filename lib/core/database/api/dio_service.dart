import 'dart:developer';

import 'package:animooo/core/database/api/api_consumer.dart';
import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService implements ApiConsumer {
  final Dio _dio;


  DioService(this._dio) {
    _initDio();
  }
  void _initDio() {
    _dio.options.baseUrl = EndPoints.baseUrl;
    //interceptors while every request and response and error
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
    //interceptors for logging
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        enabled: kDebugMode,
        request: true,
      ),
    );
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //token can be added here if needed
    handler.next(options); //continue
  }

  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    // You can process the response here
    handler.next(response); //continue
  }

  void _onError(DioException err, ErrorInterceptorHandler handler) {
    // You can handle errors here
    handler.next(err); //continue
  }

  @override
  Future<dynamic> delete({required String path}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> get({required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await _dio.get(path,queryParameters: queryParameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw ServerFailure(
          'Error: ${response.statusCode} - ${response.statusMessage} - ${response.data.toString()}',
        );
      }
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioException(e);
      } else {
        throw ServerFailure('Unexpected error occurred: ${e.toString()}');
      }
    }
  }

  @override
  Future<dynamic> post({required String path, required Object? data}) async {
    try {
      var response = await _dio.post(path, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        log("response status code:${response.statusCode}");
        log("response data :${response.data}");
        throw ServerFailure(
          'Error: ${response.statusCode.toString()} - ${response.statusMessage} - ${response.data.toString()}',
        );
      }
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioException(e);
      } else {
        log("unexpected error :${e.toString()}");
        throw ServerFailure('Unexpected error occurred: ${e.toString()}');
      }
    }
  }

  @override
  Future<dynamic> put({required String path}) {
    throw UnimplementedError();
  }
}
