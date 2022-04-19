import 'package:dio/dio.dart';
import 'package:news/utils/fetch/ErrorEntiry.dart';

class CustomInterceptors implements Interceptor {
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Do something before request is sent
    return handler.next(options); //continue
    // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data
    return handler.next(response); // continue
    // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  void onError(DioError error, ErrorInterceptorHandler handler) {
    // Do something with response error
    return handler.reject(error); //continue
    // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
  }
}
