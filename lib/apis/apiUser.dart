import 'package:news/models/index.dart';
import 'package:news/utils/utils.dart';

class ApiUserUrl {
  static String login = "/user/login";
}

class UserApi {
  static Future<dynamic> login({required Login params}) async {
    var response = await HttpUtil().post(ApiUserUrl.login);
    return response;
  }
}
