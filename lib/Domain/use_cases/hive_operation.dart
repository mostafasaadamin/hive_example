import 'package:hive/hive.dart';
import 'package:hive_example/Data/Models/clients.dart';

class HiveOperations{
  static final _instance = HiveOperations._internal();
  HiveOperations._internal();
  static HiveOperations getInstance() {
    return _instance;
  }
  void insertIntoHive(List<GetApprovedDetailsObjct>? clientsList) {
    final contactsBox = Hive.box('Clients');
    contactsBox.clear();
    for (int i = 0; i < clientsList!.length; i++) {
      contactsBox.add(clientsList[i]);
    }
  }
  List<GetApprovedDetailsObjct>? readFromClientsTable(){
    List<GetApprovedDetailsObjct>?  clientsList=[];
    final contactsBox = Hive.box('Clients');
    for (int i = 0; i < contactsBox.length; i++) {
      GetApprovedDetailsObjct client = contactsBox.get(i) as GetApprovedDetailsObjct;
      clientsList.add(client);
    }
    return clientsList;
  }

}