import 'package:hive/hive.dart';
part 'clients.g.dart';


class ApprovedDetails  {
  List<GetApprovedDetailsObjct>? lGetApprovedDetailsObjct;
  Result? rResult;
  ApprovedDetails({this.lGetApprovedDetailsObjct, this.rResult});
  ApprovedDetails.fromJson(Map<String, dynamic> json) {
    if (json['_GetApprovedDetailsObjct'] != null) {
      lGetApprovedDetailsObjct = <GetApprovedDetailsObjct>[];
      json['_GetApprovedDetailsObjct'].forEach((v) {
        lGetApprovedDetailsObjct!.add( GetApprovedDetailsObjct.fromJson(v));
      });
    }
    rResult =
    json['_Result'] != null ?  Result.fromJson(json['_Result']) : null;
  }
}
@HiveType(typeId: 0)
class GetApprovedDetailsObjct extends HiveObject {
  @HiveField(0)
  int? aPPRVD;
  @HiveField(1)
  String? aPPRVDDATE;
  @HiveField(2)
  String? aPPRVDDESC;
  @HiveField(3)
  String? aPPRVDNM;
  @HiveField(4)
  String? dOCDATE;
  @HiveField(5)
  String? dOCDESC;
  @HiveField(6)
  int? dOCNO;
  @HiveField(7)
  String? dOCSER;
  @HiveField(8)
  int? dOCTYP;
  @HiveField(9)
  String? dOCTYPNM;
  @HiveField(10)
  String? lVLNM;
  @HiveField(11)
  int? lVLNO;
  @HiveField(12)
  int? oRDRNO;

  GetApprovedDetailsObjct(
      {this.aPPRVD,
        this.aPPRVDDATE,
        this.aPPRVDDESC,
        this.aPPRVDNM,
        this.dOCDATE,
        this.dOCDESC,
        this.dOCNO,
        this.dOCSER,
        this.dOCTYP,
        this.dOCTYPNM,
        this.lVLNM,
        this.lVLNO,
        this.oRDRNO});

  GetApprovedDetailsObjct.fromJson(Map<String, dynamic> json) {
    aPPRVD = json['APPRVD'];
    aPPRVDDATE = json['APPRVD_DATE'];
    aPPRVDDESC = json['APPRVD_DESC'];
    aPPRVDNM = json['APPRVD_NM'];
    dOCDATE = json['DOC_DATE'];
    dOCDESC = json['DOC_DESC'];
    dOCNO = json['DOC_NO'];
    dOCSER = json['DOC_SER'];
    dOCTYP = json['DOC_TYP'];
    dOCTYPNM = json['DOC_TYP_NM'];
    lVLNM = json['LVL_NM'];
    lVLNO = json['LVL_NO'];
    oRDRNO = json['ORDR_NO'];
  }
}
class Result {
  int? iDocNo;
  String? sErrMsg;
  int? iErrNo;
  bool? bErrStatuse;

  Result({this.iDocNo, this.sErrMsg, this.iErrNo, this.bErrStatuse});

  Result.fromJson(Map<String, dynamic> json) {
    iDocNo = json['_Doc_No'];
    sErrMsg = json['_ErrMsg'];
    iErrNo = json['_ErrNo'];
    bErrStatuse = json['_ErrStatuse'];
  }
}