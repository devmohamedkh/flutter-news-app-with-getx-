import 'dart:convert';
import 'package:http/http.dart';
import 'package:news/models/articl_model.dart';

class NewsServis {
  Future<List<Article>> getTopheadlines() async {
    const String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=d3ad74c38c8e4ed5aaa5a0e8bd52c4c2';
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('cant load tha data');
    }
  }

  Future<List<Article>> getAllArtical() async {
    const String url =
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=d3ad74c38c8e4ed5aaa5a0e8bd52c4c2';
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final reslt = jsonDecode(response.body);
      Iterable list = reslt['articles'];
      return list.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('cant load tha data');
    }
  }

  Future<List<Article>> getSearch(String query) async {
    final String url =
        'https://newsapi.org/v2/everything?q=$query&apiKey=d3ad74c38c8e4ed5aaa5a0e8bd52c4c2';
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final reslt = jsonDecode(response.body);
      Iterable list = reslt['articles'];
      return list.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('cant load tha data');
    }
  }
}
