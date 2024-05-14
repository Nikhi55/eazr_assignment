import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  static const String apiKey = "8584bc04823a4115b95daf17fce1d324";
  static const String baseUrl = "https://newsapi.org/v2";

  Future<List<Article>> getArticlesByCategory(String category) async {
    final Uri url = Uri.parse(
      '$baseUrl/top-headlines?country=us&category=$category&apiKey=$apiKey',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];
        return articles.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the API: $e');
    }
  }

  Future<List<Article>> getTopHeadline() async {
    final Uri url = Uri.parse(
      '$baseUrl/top-headlines?country=us&apiKey=$apiKey',
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> topHeadlineArticle = data['articles'];
        return topHeadlineArticle
            .map((json) => Article.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the API: $e');
    }
  }
}

class Article {
  final String title;
  final String description;
  final String url;
  final String imageUrl;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}
