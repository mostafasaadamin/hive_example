import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_example/Domain/clients_view_models.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'home_page_items/clients_table.dart';
import 'package:intl/intl.dart';

class HomeDetails extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeDetails> {
  late DateTime _dateTimeFrom;
  late DateTime _dateTimeTo;
  String value = "";
  String startDate='',endDate='';
  late ClientsViewModel clientsModel;
  @override
  void initState() {
    clientsModel = Provider.of<ClientsViewModel>(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        clientsModel.getClientsFromHive(startDate,endDate);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("تفاصيل العملاء"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                startDate='';endDate='';
                clientsModel.getClientsData(startDate,endDate);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                showDatePickerDialog();
                },
            )
          ],
        ),
        body: Consumer<ClientsViewModel>(builder: (context, model, _) {
          return model.clientsList!.isEmpty && model.errorMessage!.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : model.clientsList!.isEmpty && model.errorMessage!.isNotEmpty
                  ? Center(child: Text(model.errorMessage!))
                  :ClientsTable(clientsData: model.clientsList!);
        }));
  }

  showDatePickerDialog() {
    showDialog(builder: (context) =>  AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        backgroundColor: Colors.white,
        title:const Center(child:   Text("range data",style:TextStyle(color:Colors.black))),
        content: Container(
          decoration:  const BoxDecoration(
            shape: BoxShape.rectangle,
            color:  Colors.white,
            borderRadius:  BorderRadius.all( Radius.circular(30.0)),
          ),

          height: 200,
          child: SfDateRangePicker(
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args)
            {
              if (args.value is PickerDateRange) {
                _dateTimeFrom = args.value.startDate;
                _dateTimeTo = args.value.endDate ?? args.value.startDate;
                startDate= DateFormat("dd/MM/yyyy")
                    .format(_dateTimeFrom)
                    .toString();
                endDate = DateFormat("dd/MM/yyyy")
                    .format(_dateTimeTo)
                    .toString();

              } else if (args.value is DateTime) {
                // _selectedDate = args.value.toString();
              } else if (args.value is List<DateTime>) {
                // _dateCount = args.value.length.toString();
              } else {
                // _rangeCount = args.value.length.toString();
              }
            },
            selectionMode: DateRangePickerSelectionMode.range,
            initialSelectedRange: PickerDateRange(
                startDate.isEmpty?
                DateTime.now().
                subtract(const Duration(days: 4)):
                DateFormat('MM/dd/yyyy').parse(startDate),
                endDate.isEmpty?
                DateTime.now().add(const Duration(days: 3)):
                DateFormat('MM/dd/yyyy').parse(endDate)

            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text("بحث",style:TextStyle(fontSize: 15)),
            textColor:Colors.white ,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            color:Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();
              clientsModel.getClientsData(startDate,endDate);
            },
          ),
          FlatButton(
            child: const Text("إلغاء",style:TextStyle(fontSize: 15)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            textColor:Colors.white ,
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]
    ), context: context
    );
  }
}
