

import 'package:flutter/material.dart';
import 'package:hive_example/Domain/news_view_models.dart';
import 'package:hive_example/elements/news_widget.dart';
import 'package:provider/provider.dart';

class HomeNews extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  late NewsViewModel newsModel;
  @override
  void initState() {
    newsModel=Provider.of<NewsViewModel>(context, listen: false);
   WidgetsBinding.instance!.addPostFrameCallback((_) {
     newsModel.getNewsListData();
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Demo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Consumer<NewsViewModel>(
            builder: (context, model, _) {
              return model.newsList!.isEmpty&&model.errorMessage!.isEmpty?
              const Center(child: CircularProgressIndicator()):
              model.newsList!.isEmpty&&model.errorMessage!.isNotEmpty?
              Center(child: Text( model.errorMessage!)):
              ListView.builder(
                itemCount: model.newsList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return newWidget(article:model.newsList![index]);
                },
              );
            }
        )
      ),
    );
  }
}
