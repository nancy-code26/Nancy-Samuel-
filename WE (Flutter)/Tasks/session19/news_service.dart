import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled3/news_model.dart';

class NewsService {
  final String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=044b4316c4b84857adb25000c2bcae64";

  Future<List<Article>> fetchNews() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> articlesJson = data['articles'];
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}