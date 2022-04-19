import 'package:news/models/index.dart';

class Global {
  /// 用户配置

  static UserLogin profile = UserLogin.fromJson({"accessToken": null});

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
}
