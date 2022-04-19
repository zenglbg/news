import 'package:news/utils/utils.dart';

class ApiNewsUrl {
  static String newslist = "/index/news";
  static String newsRecommended = "/index/news/recommended";
  static String Categories = "/index/news/categories";
  static String Channels = "/index/news/channels";
  static String tags = "/index/news/tags";
}

class NewsApi {
  static Future newsPageList({dynamic params}) async {
    var response = await HttpUtil().get(ApiNewsUrl.newslist, params: params);
    return response;
  }

  static Future newsRecommended({dynamic params}) async {
    var response =
        await HttpUtil().get(ApiNewsUrl.newsRecommended, params: params);
    return response;
  }

  static Future Categories({dynamic params}) async {
    var response = await HttpUtil().get(ApiNewsUrl.Categories, params: params);
    return response;
  }

  static Future Channels({dynamic params}) async {
    var response = await HttpUtil().get(ApiNewsUrl.Channels, params: params);
    return response;
  }

  static Future tags({dynamic params}) async {
    var response = await HttpUtil().get(ApiNewsUrl.tags, params: params);
    return response;
  }
}
