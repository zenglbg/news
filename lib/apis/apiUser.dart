import 'package:news/models/index.dart';
import 'package:news/utils/utils.dart';

class UserApi {
  static Future<dynamic> login({required Login params}) async {
    var response = await HttpUtil().post('/user/login');
    return response;
  }
}
