import 'package:flutter/material.dart';
import 'package:hive_example/Domain/news_view_models.dart';
import 'package:hive_example/Presentation/home_news.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsViewModel>(create:(_)=>NewsViewModel()),
      ],
      child: MaterialApp(
        title: 'HiveDemo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeNews(),
      ),
    );
  }
}


