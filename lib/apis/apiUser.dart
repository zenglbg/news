import 'package:news/models/User.dart';
import 'package:news/utils/utils.dart';

class UserApi {
  static Future<User> login({required User params}) async {
    var response = await HttpUtil().post('/user/login', params: params);
    return User.fromJson(response);
  }
}
