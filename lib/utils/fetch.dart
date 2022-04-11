import 'package:dio/dio.dart';
import 'package:news/utils/utils.dart';
import 'package:news/values/values.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;
  CancelToken cancelToken = new CancelToken();

  HttpUtil._internal() {
    BaseOptions options = new BaseOptions(baseUrl: 'http://localhost:3333');

    dio = new Dio(options);
  }

  /// 读取本地配置
  Options getLocalOptions() {
    Options options = Options();
    // String token = StorageUtil().getItem(STORAGE_USER_TOKEN_KEY);
    // if (token != null) {
    //   options = Options(headers: {
    //     'Authorization': 'Bearer $token',
    //   });
    // }
    return options;
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
