import '../models/article_model.dart';
import '../services/api_services.dart';

class ApiRepository {
  final ApiServices apiServices;

  ApiRepository({required this.apiServices});

  Future<List<Article>> getArticle() async {
    final response = await apiServices.fetchArticleApi();

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final data = response.data['articles'] as List<dynamic>;

      List<Article> articles = data.map((article) => Article.fromMap(article)).toList();

      return articles;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load articles');
    }
  }
}
