import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;
  late Map errors;
  late List amountErrors;

  DioExceptions.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
      // if (dioError.message.contains("SocketException")) {
      //   message = 'No Internet';
      //   break;
      // } else if (dioError.message.contains('HandshakeException')) {
      //   message = 'Response data not found';
      //   break;
      // }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  DioExceptions.forRegisterError(DioException dioException){
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = dioException.response!.data['message'];
        errors = dioException.response!.data['errors'] ?? {};
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
      // if (dioError.message.contains("SocketException")) {
      //   message = 'No Internet';
      //   break;
      // } else if (dioError.message.contains('HandshakeException')) {
      //   message = 'Response data not found';
      //   break;
      // }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  DioExceptions.fromCalculationError(DioException dioException){
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = dioException.response!.data['meta']['message'];
        errors = dioException.response!.data['meta']['errors'];
        amountErrors = errors['amount'];
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
      // if (dioError.message.contains("SocketException")) {
      //   message = 'No Internet';
      //   break;
      // } else if (dioError.message.contains('HandshakeException')) {
      //   message = 'Response data not found';
      //   break;
      // }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  DioExceptions.fromDollarRateError(DioException dioException){
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = dioException.response!.data['meta']['message'];
        errors = dioException.response!.data['meta']['errors'];
        amountErrors = errors['tranche_id'];
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
      // if (dioError.message.contains("SocketException")) {
      //   message = 'No Internet';
      //   break;
      // } else if (dioError.message.contains('HandshakeException')) {
      //   message = 'Response data not found';
      //   break;
      // }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['message'] ?? 'Bad request';
      case 401:
        return error['message'] ?? 'Unauthorized';
      case 403:
        return error['message'] ?? 'Forbidden';
      case 404:
        return error['message'];
      case 420:
        return 'Session Expired. Please LogIn again';
      case 422:
        return error['message'];
      case 424:
        return error['message'];
      case 429:
        return 'Слишком много попыток. Попробуйте позже.';
      case 500:
        return error['message'] ?? 'Internal server error';
      case 502:
        return error['message'] ?? 'Server unavailable';
      default:
        return 'Что-то пошло не так!';
    }
  }

  @override
  String toString() => message;
}
