import 'package:dio/dio.dart';

class ErrorEntity implements Exception {
  int code;
  String message;

  ErrorEntity({
    required this.code,
    required this.message,
  });

  String toString() {
    if (message == null) return 'Exception';
    return "Exception: code: $code, $message";
  }
}

ErrorEntity createErrorEntity(DioError error) {
  Map<int, dynamic> errorCode = {
    400: ErrorEntity(code: 400, message: "请求语法错误"),
    401: ErrorEntity(code: 401, message: "没有权限"),
    403: ErrorEntity(code: 403, message: "服务器拒绝执行"),
    404: ErrorEntity(code: 404, message: "无法连接服务器"),
    405: ErrorEntity(code: 405, message: "请求方法被禁止"),
    500: ErrorEntity(code: 500, message: "服务器内部错误"),
    502: ErrorEntity(code: 502, message: "无效的请求"),
    503: ErrorEntity(code: 503, message: "服务器挂了"),
    505: ErrorEntity(code: 505, message: "不支持HTTP协议请求"),
  };
  Map<Enum, dynamic> errorType = {
    DioErrorType.cancel: ErrorEntity(code: -1, message: "请求取消"),
    DioErrorType.connectTimeout: ErrorEntity(code: -1, message: "连接超时"),
    DioErrorType.sendTimeout: ErrorEntity(code: -1, message: "请求超时"),
    DioErrorType.receiveTimeout: ErrorEntity(code: -1, message: "响应超时"),
    DioErrorType.response: errorCode[error.response?.statusCode] ??
        ErrorEntity(code: -1, message: "未知错误")
  };
  return errorType[error.type] ?? ErrorEntity(code: -1, message: error.message);
}
