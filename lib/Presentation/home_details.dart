import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_example/Data/Models/NameOne.dart';
import 'package:hive_example/Domain/clients_view_models.dart';
import 'package:provider/provider.dart';
import 'package:data_table_2/data_table_2.dart';

import 'home_page_items/clients_table.dart';

class HomeDetails extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeDetails> {
  late ClientsViewModel clientsModel;
  @override
  void initState() {
    clientsModel = Provider.of<ClientsViewModel>(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      clientsModel.getClientsData();
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
