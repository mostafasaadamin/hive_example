
import 'package:flutter/material.dart';
import 'package:hive_example/Data/Models/approved_detais.dart';
import 'package:data_table_2/data_table_2.dart';

class ClientsTable extends StatelessWidget {
  List<GetApprovedDetailsObjct>clientsData;
  ClientsTable({required this.clientsData});
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top:10),
      child:DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          headingRowColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.2)),
          columns: const [

            DataColumn2(
              label: Text('النوع',style: TextStyle(fontWeight: FontWeight.bold),),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('الرقم',style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('التاريخ',style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('مستوي الاعتماد',style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('حالة الاعتماد',style: TextStyle(fontWeight: FontWeight.bold)),
              numeric: true,
            ),
            DataColumn(
              label: Text('تغيير الحالة',style: TextStyle(fontWeight: FontWeight.bold)),
              numeric: true,
            ),
          ],
          rows: List<DataRow>.generate(
              clientsData.length,
                  (index) => DataRow(cells: [
                DataCell(Text(clientsData[index].dOCTYPNM!)),
                DataCell(Text(clientsData[index].oRDRNO.toString())),
                DataCell(Text(clientsData[index].dOCDATE!)),
                DataCell(Text(clientsData[index].lVLNM!)),
                DataCell(Text(clientsData[index].aPPRVDNM!)),
                DataCell(
                  FlatButton(
                    color:clientsData[index].aPPRVD==0? Colors.blue:Colors.grey,
                    child: Text(clientsData[index].aPPRVD==0?
                    'إعتماد':"إلغاء",style: const TextStyle(color: Colors.white),),
                    onPressed: () {

                    },
                  ),

                ),

              ]))),
    );
  }
}
