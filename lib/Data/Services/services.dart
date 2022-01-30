import 'dart:convert';
import 'package:hive_example/Data/Models/news.dart';
import 'package:http/http.dart' as http;
class ApiService {
  final endPointUrl = "https://newsapi.org";
  final client = http.Client();
  Future<List<Articles>?> getArticle() async {
    final queryParameters = {
      'country': 'us',
      'category': 'technology',
      'apiKey': 'c3ab767b13784ba1a5ff5a7885b566a1'
    };
    try {
      final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
      final response = await client.get(uri);
      if(response.statusCode==200) {
        Aticles articlesData = jsonDecode(response.body);
        return articlesData.articles;
      }else{
        return [];
      }
    }catch(e){
      print("ErrorIs${e.toString()}");
      return [];
    }
  }
}