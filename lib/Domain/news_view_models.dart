import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/Data/Models/news.dart';
import 'package:hive_example/Data/Services/services.dart';

class NewsViewModel extends ChangeNotifier {
  List<Articles>? _newsList = [];
  String? _errorMessage = "";

  String? get errorMessage => _errorMessage;

  List<Articles>? get newsList => _newsList;

  getNewsListData() async {
    bool isConnected = await isInternet();
    if (isConnected) {
      _newsList = await ApiService().getArticle();
    } else {
      ///Load data From Hive Cashed if it exists
      final contactsBox = Hive.box('News');
      for (int i = 0; i < contactsBox.length; i++) {
        Articles article = contactsBox.get(i) as Articles;
        _newsList!.add(article);
      }
    }
    if (_newsList!.isEmpty) {
      _errorMessage = "An error happened";
    } else if(isConnected) {
      insertIntoHive(_newsList);
      ///insert data into hive
    }
    notifyListeners();
  }

  Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  void insertIntoHive(List<Articles>? newsList) {
    final contactsBox = Hive.box('News');
    contactsBox.clear();
    for (int i = 0; i < _newsList!.length; i++) {
      contactsBox.add(_newsList![i]);
    }
  }
}
