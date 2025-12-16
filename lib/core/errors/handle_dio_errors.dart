import 'package:dio/dio.dart';

String handleDioError(DioException exception) {
  String message;

  if (exception.type == DioExceptionType.connectionError) {
    message = 'No internet connection. Please check your network.';
  } else if (exception.type == DioExceptionType.connectionTimeout) {
    message = 'Connection timeout. Please try again.';
  } else {
    final data = exception.response?.data;
    message = data is Map && data['message'] != null
        ? data['message'].toString()
        : 'Something went wrong. Please try again.';
  }

  return message;
}

