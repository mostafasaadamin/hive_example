import 'package:flutter/material.dart';
import 'package:hive_example/Data/Models/NameOne.dart';
import 'package:hive_example/Domain/news_view_models.dart';
import 'package:provider/provider.dart';
import 'package:data_table_2/data_table_2.dart';
class HomeDetails extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeDetails> {
  List<NameOne> namelist = [];
  late ClientsViewModel newsModel;
  @override
  void initState() {
    namelist.add(NameOne(sn:"1", name:"Name 1", address:"Address 1", phone: "Phone 1"));
    namelist.add(NameOne(sn:"2", name:"Name 2", address:"Address 2", phone: "Phone 2"));
    namelist.add(NameOne(sn:"3", name:"Name 3", address:"Address 3", phone: "Phone 3"));
    newsModel=Provider.of<ClientsViewModel>(context, listen: false);
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
      body:
      Container(
        padding: EdgeInsets.all(15),
    child:DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        headingRowColor: MaterialStateProperty.all(Colors.green),
        columns: const [

          DataColumn2(
            label: Text('النوع'),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('الرقم'),
          ),
          DataColumn(
            label: Text('التاريخ'),
          ),
          DataColumn(
            label: Text('مستوي الاعتماد'),
          ),
          DataColumn(
            label: Text('حالة الاعتماد'),
            numeric: true,
          ),
          DataColumn(
            label: Text('تغيير الحالة'),
            numeric: true,
          ),
        ],
        rows: List<DataRow>.generate(
            namelist.length,
                (index) => DataRow(cells: [
              DataCell(Text(namelist[index].sn)),
              DataCell(Text(namelist[index].name)),
              DataCell(Text(namelist[index].address)),
              DataCell(Text(namelist[index].phone)),
              DataCell(Text(namelist[index].phone)),
              DataCell(
                FlatButton(
                  color: Colors.blue,
                  child: Text('تغيير',style: TextStyle(color: Colors.white),),
                  onPressed: () {

                  },
                ),

              ),

                ]))),
      ));


    // body: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child:Consumer<ClientsViewModel>(
    //       builder: (context, model, _) {
    //         return model.clientsList!.isEmpty&&model.errorMessage!.isEmpty?
    //         const Center(child: CircularProgressIndicator()):
    //         model.clientsList!.isEmpty&&model.errorMessage!.isNotEmpty?
    //         Center(child: Text( model.errorMessage!)):
    //         ListView.builder(
    //           itemCount: model.clientsList!.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return Container();///newWidget(article:model.clientsList![index]);
    //           },
    //         );
    //       }
    //   )
    // ),
  }
}
