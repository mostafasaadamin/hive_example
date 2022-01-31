import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/Data/Models/news.dart';
import 'package:hive_example/Data/Models/source.dart';
import 'package:hive_example/Domain/news_view_models.dart';
import 'package:hive_example/Presentation/home_news.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocumentDir = await getApplicationDocumentsDirectory();
   Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(SourceAdapter());
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsViewModel>(create: (_) => NewsViewModel()),
      ],
      child: MaterialApp(
        title: 'HiveDemo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: Hive.openBox('News'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return HomeNews();
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
