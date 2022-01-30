import 'package:flutter/cupertino.dart';
import 'package:hive_example/Data/Models/news.dart';
import 'package:hive_example/Data/Services/services.dart';

class NewsViewModel extends ChangeNotifier {
  List<Articles>? _newsList=[];
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  getNewsListData() async {
    _newsList = await ApiService().getArticle();
    if (_newsList!.isEmpty) {
      _errorMessage="An error happened";
    }
    notifyListeners();
  }
  List<Articles>? get newsList => _newsList;
}
