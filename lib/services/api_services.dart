import 'package:dio/dio.dart';
import '../constants/api_constant.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<Response> fetchArticleApi() async {
    try {
      final Response response = await _dio.get(baseUrl + newsUrl);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
