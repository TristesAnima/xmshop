import 'package:dio/dio.dart';

class HttpsClient {
  static String domain = 'https://xiaomi.itying.com';

  static Dio dio = Dio();

  HttpsClient() {
    dio.options.baseUrl = domain;
  }

  Future get(apiUrl, {Map<String, dynamic>? params}) async {
    try {
      var response = await dio.get(apiUrl, queryParameters: params);
      return response;
    } catch (err) {
      print("请求超时");
      return null;
    }
  }

  static String getAllUri(String picUrl) {
    return '$domain/$picUrl';
  }
}
