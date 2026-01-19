import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
  @override
  String toString() => errMessage;
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  static Failure fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.badResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Request canceled');
      case DioExceptionType.connectionError:
        return const ServerFailure('Check your internet connection and try again');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate');
      default:
        return const ServerFailure('Unknown error');
    }
  }

  factory ServerFailure.badResponse(int statusCode, dynamic response) {
    String errorMessage = '';

    if (response['error'] is List) {
      errorMessage = (response['error'] as List).join(', ');
    } else {
      errorMessage = "Oops! there was an error, please try again!";
    }

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage);
    } else if (statusCode == 404) {
      return const ServerFailure(
        "Your request was not found, please try later!",
      );
    } else if (statusCode >= 500) {
      return const ServerFailure("Internal server error, please try later!");
    } else {
      return ServerFailure(errorMessage);
    }
  }
}
