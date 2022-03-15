import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_example/Data/Models/NameOne.dart';
import 'package:hive_example/Domain/news_view_models.dart';
import 'package:provider/provider.dart';
import 'package:data_table_2/data_table_2.dart';

import 'home_page_items/clients_table.dart';

class HomeDetails extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeDetails> {
  List<NameOne> namelist = [];
  late ClientsViewModel newsModel;

  @override
  void initState() {
    namelist.add(NameOne(
        sn: "1", name: "Name 1", address: "Address 1", phone: "Phone 1"));
    namelist.add(NameOne(
        sn: "2", name: "Name 2", address: "Address 2", phone: "Phone 2"));
    namelist.add(NameOne(
        sn: "3", name: "Name 3", address: "Address 3", phone: "Phone 3"));
    newsModel = Provider.of<ClientsViewModel>(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      newsModel.getClientsData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Clients"),
          centerTitle: true,
        ),
        body: Consumer<ClientsViewModel>(builder: (context, model, _) {
          return model.clientsList!.isEmpty && model.errorMessage!.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : model.clientsList!.isEmpty && model.errorMessage!.isNotEmpty
                  ? Center(child: Text(model.errorMessage!))
                  :ClientsTable(clientsData: model.clientsList!);
        }));
  }
}
