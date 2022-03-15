import 'dart:convert';
import 'package:hive_example/Data/Models/approved_detais.dart';
import 'package:hive_example/Data/Models/news.dart';
import 'package:http/http.dart' as http;

class ApiService {
   final client = http.Client();
  Future<List<GetApprovedDetailsObjct>?> getClients() async {
    try {
      final response = await client.get(Uri.parse("http://mapp.yemensoft.net/WEBONYXMOBILEV2/Service1.svc/GetApprovedDetails?YearNo=2021&ActvieNo=1&P_USR_NO=1&P_DOC_TYP=53&P_APPRVD=0&P_LVL_NO=NULL&P_F_DOC_NO=NULL&P_T_DOC_NO=NULL&P_F_DOC_DATE=NULL&P_T_DOC_DATE=NULL&DOC_SER=&Lang_No=1&op_type=1"));
      print("[SentUrl]");
      print("[response][body]${json.decode(response.body)}");
      if (response.statusCode == 200) {
        ApprovedDetails clientsDetails = ApprovedDetails.fromJson(json.decode(response.body));
        return clientsDetails.lGetApprovedDetailsObjct;
      } else {
        return [];
      }
    } catch (e) {
      print("ErrorIs${e.toString()}");
      return [];
    }
  }
}
