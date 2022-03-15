import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/Data/Models/clients.dart';
import 'package:hive_example/Data/Services/clients_services.dart';

class ClientsViewModel extends ChangeNotifier {
  List<GetApprovedDetailsObjct>? _clientList = [];
  String? _errorMessage = "";
  String? get errorMessage => _errorMessage;
  List<GetApprovedDetailsObjct>? get clientsList => _clientList;

  getClientsData(String startData,String endDate) async {
    _clientList!.clear();
    _errorMessage="";
    notifyListeners();
    bool isConnected = await isInternet();
    if (isConnected) {
      _clientList = await ClientsService().getClients(startData,endDate);
      if(_clientList!.isEmpty){
        _errorMessage="لا يوجد عملاء في الفترة المختارة";
      }else{

      }
    } else {
      ///Load data From Hive Cashed if it exists
      // final contactsBox = Hive.box('News');
      // for (int i = 0; i < contactsBox.length; i++) {
      //   Articles article = contactsBox.get(i) as Articles;
      //   _clientList!.add(article);
      // }
    }
    // if (_newsList!.isEmpty) {
    //   _errorMessage = "An error happened";
    // } else if(isConnected) {
    //   insertIntoHive(_newsList);
    //   ///insert data into hive
    // }
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

  void insertIntoHive(List<Articles>? clientsList) {
    final contactsBox = Hive.box('News');
    contactsBox.clear();
    for (int i = 0; i < _newsList!.length; i++) {
      contactsBox.add(_newsList![i]);
    }
  }

}
