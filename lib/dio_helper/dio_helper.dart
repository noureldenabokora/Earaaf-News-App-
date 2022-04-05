import 'package:dio/dio.dart';

class DioHellper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}


/*

https://newsapi.org/
v2/top-headlines?
country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca
*/



/* 
https://newsapi.org
/v2/everything?
q=bitcoin&apiKey=40e204ebef0a4aa788d47bcd64533d09
*/