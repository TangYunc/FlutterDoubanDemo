import 'package:dio/dio.dart';
import 'http_config.dart';

/**
 * 封装公共好用的方法
 * 防止有一天这个库不再更新
 * */

class HttpRequest {

  //创建Dio实例
  static BaseOptions baseOptions = BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: TIMEOUT
  );
  static final dio = Dio(baseOptions);

  static Future request(String url, {String method = "get", Map<String, dynamic> params}) async {
    //2.发送网络请求
    Options option = Options(method: method);
    try {
      final result = await dio.request(url, queryParameters: params, options: option);
      return result;
    } on DioError catch(err) {
      throw err;
    }
  }
}