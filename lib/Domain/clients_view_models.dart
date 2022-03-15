import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/Data/Models/clients.dart';
import 'package:hive_example/Data/Services/clients_services.dart';

import 'use_cases/hive_operation.dart';

class ClientsViewModel extends ChangeNotifier {
  List<GetApprovedDetailsObjct>? _clientList = [];
  String? _errorMessage = "";
  String? get errorMessage => _errorMessage;
  List<GetApprovedDetailsObjct>? get clientsList => _clientList;

   getClientsFromHive(String startData,String endDate)async{
     _clientList!.clear();
     notifyListeners();
     _clientList=await  HiveOperations.getInstance().readFromClientsTable();
     if(_clientList!.isEmpty){
       getClientsData( startData,endDate);
     }
     notifyListeners();
   }

  getClientsData(String startData,String endDate) async {
     print("[getClientsData][Called]");
    _clientList!.clear();
    _errorMessage="";
      notifyListeners();
      _clientList = await ClientsService().getClients(startData,endDate);
      if(_clientList!.isEmpty){
        _errorMessage="لا يوجد عملاء في الفترة المختارة";
      }else{
        HiveOperations.getInstance().insertIntoHive(_clientList);
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


}