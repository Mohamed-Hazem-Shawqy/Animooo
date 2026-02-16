import 'dart:developer';
import 'package:animooo/core/database/api/api_consumer.dart';
import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/errors/failuer.dart';
import 'package:animooo/core/helper_function/force_logout.dart';
import 'package:animooo/core/helper_function/get_new_access_token.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService implements ApiConsumer {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;
  Future<String?>? _refreshTokenFuture;

  DioService(this._dio, this._secureStorage) {
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

  void _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _secureStorage.read(key: AppStrings.kAccessToken);
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options); //continue
  }

  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    // You can process the response here
    handler.next(response); //continue
  }

  void _onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_isUnauthorized(err) && _shouldRefresh(err.requestOptions)) {
      // Attempt refresh if not already happening
      _refreshTokenFuture ??= _refreshAccessToken();

      final newToken = await _refreshTokenFuture;
      if (newToken != null) {
        // Retry the original request
        final clonedRequest = _retryRequest(err.requestOptions, newToken);
        try {
          final response = await _dio.fetch(clonedRequest);
          return handler.resolve(response);
        } catch (e) {
          return handler.next(e as DioException);
        }
      } else {
        forceLogoutFunc();
        return handler.next(err);
      }
      // If refresh fails, newToken == null => pass the 401 up
    } else {
      return handler.next(err);
    }
  }

  ///////////////////////////////////
  bool _isUnauthorized(DioException err) {
    return err.response?.statusCode == 401;
  }

  bool _shouldRefresh(RequestOptions requestOptions) {
    // Avoid refreshing again if it's the refresh token call
    return !requestOptions.path.contains(EndPoints.generateNewAccessToken);
  }

  RequestOptions _retryRequest(RequestOptions requestOptions, String newToken) {
    final newHeaders = Map<String, dynamic>.from(requestOptions.headers);
    newHeaders['Authorization'] = 'Bearer $newToken';
    return requestOptions.copyWith(headers: newHeaders);
  }

  Future<String?> _refreshAccessToken() async {
    try {
      final refreshToken = await _secureStorage.read(
        key: AppStrings.kRefreshToken,
      );

      if (refreshToken == null || refreshToken.isEmpty) return null;

      final newAccessToken = await getNewAccessTokenFunc();

      await _secureStorage.write(
        key: AppStrings.kAccessToken,
        value: newAccessToken,
      );

      return newAccessToken;
    } catch (e) {
      await _secureStorage.delete(key: AppStrings.kAccessToken);
      await _secureStorage.delete(key: AppStrings.kRefreshToken);
      return null;
    } finally {
      _refreshTokenFuture = null;
    }
  }

  /////////////////////////////////////
  @override
  Future<dynamic> delete({
    required String path,
    required Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.delete(path, queryParameters: queryParameters);
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
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(path, queryParameters: queryParameters);
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
  Future<dynamic> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
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
    // TODO: implement put

    throw UnimplementedError();
  }
}
