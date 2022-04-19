import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:news/Global.dart';
import 'package:news/utils/fetch/ErrorEntiry.dart';
import 'interceptors.dart';
import 'package:news/utils/utils.dart';
import 'package:news/values/proxy.dart';
import 'package:news/values/values.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;
  CancelToken cancelToken = new CancelToken();

  HttpUtil._internal() {
    BaseOptions options = new BaseOptions(baseUrl: 'http://localhost:3333');

    dio = new Dio(options);

    dio.interceptors.add(CustomInterceptors());

    // dio.interceptors.add(InterceptorsWrapper(
    //     onRequest: (options, handler) => handler
    //         .resolve(Response(requestOptions: options, data: 'fake data'))));

    if (!Global.isRelease && PROXY_ENABLE) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (url) => "PROXY $PROXY_IP:$PROXY_PORT";
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  /// 读取本地配置
  Options getLocalOptions() {
    Options options = Options();
    var token = StorageUtil().getItem(STORAGE_USER_TOKEN_KEY);
    if (token != null) {
      options = Options(headers: {
        'Authorization': 'Bearer $token',
      });
    }
    return options;
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /// 读取本地配置
  Map<String, dynamic> getAuthorizationHeader() {
    var headers;
    var accessToken = Global.profile.accessToken;
    if (accessToken != null) {
      headers = {
        'Authorization': 'Bearer $accessToken',
      };
    }
    return headers;
  }

  /// restful get 操作
  Future get(String path,
      {dynamic params, Options? options, CancelToken? cancelToken}) async {
    try {
      var tokenOptions = options ?? getLocalOptions();
      var response = await dio.get(path,
          queryParameters: params,
          options: tokenOptions,
          cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      // throw createErrorEntity(e);
    }
  }

  /// restful post 操作
  Future post(String path,
      {dynamic params, Options? options, CancelToken? cancelToken}) async {
    try {
      var tokenOptions = options ?? getLocalOptions();
      var response = await dio.post(path,
          data: params, options: tokenOptions, cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      // throw createErrorEntity(e);
    }
  }
}
