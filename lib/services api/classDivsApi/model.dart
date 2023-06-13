// To parse this JSON data, do
//
//     final classDiv = classDivFromJson(jsonString);

import 'dart:convert';

List<ClassDiv> classDivFromJson(String str) => List<ClassDiv>.from(json.decode(str).map((x) => ClassDiv.fromJson(x)));

String classDivToJson(List<ClassDiv> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ClassDivStatus {
  List<ClassDiv> divData;

  ClassDivStatus({required this.divData});

  factory ClassDivStatus.fromJson(List<dynamic> json) => ClassDivStatus(
      divData: json.map((e) => ClassDiv.fromJson(e)).toList());

  get data => null;
}
class ClassDiv {
    String apiStatus;
    List<DivisionDatum> divisionData;

    ClassDiv({
        required this.apiStatus,
        required this.divisionData,
    });

    factory ClassDiv.fromJson(Map<String, dynamic> json) => ClassDiv(
        apiStatus: json["api_status"],
        divisionData: List<DivisionDatum>.from(json["division_data"].map((x) => DivisionDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "api_status": apiStatus,
        "division_data": List<dynamic>.from(divisionData.map((x) => x.toJson())),
    };
}

class DivisionDatum {
    String divName;
    String divId;

    DivisionDatum({
        required this.divName,
        required this.divId,
    });

    factory DivisionDatum.fromJson(Map<String, dynamic> json) => DivisionDatum(
        divName: json["div_name"],
        divId: json["div_id"],
    );

    Map<String, dynamic> toJson() => {
        "div_name": divName,
        "div_id": divId,
    };
}
