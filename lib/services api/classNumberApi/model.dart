// To parse this JSON data, do
//
//     final classNumber = classNumberFromJson(jsonString);

import 'dart:convert';

List<ClassNumber> classNumberFromJson(String str) => List<ClassNumber>.from(
    json.decode(str).map((x) => ClassNumber.fromJson(x)));

String classNumberToJson(List<ClassNumber> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassNumData {
  List<ClassNumber> numberData;

  ClassNumData({required this.numberData});

  factory ClassNumData.fromJson(List<dynamic> json) => ClassNumData(
      numberData: json.map((e) => ClassNumber.fromJson(e)).toList());

  get data => null;
}

class ClassNumber {
  String apiStatus;
  List<ClassDatum> classData;

  ClassNumber({
    required this.apiStatus,
    required this.classData,
  });

  factory ClassNumber.fromJson(Map<String, dynamic> json) => ClassNumber(
        apiStatus: json["api_status"],
        classData: List<ClassDatum>.from(
            json["class_data"].map((x) => ClassDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "api_status": apiStatus,
        "class_data": List<dynamic>.from(classData.map((x) => x.toJson())),
      };
}

class ClassDatum {
  String className;
  String classId;

  ClassDatum({
    required this.className,
    required this.classId,
  });

  factory ClassDatum.fromJson(Map<String, dynamic> json) => ClassDatum(
        className: json["class_name"],
        classId: json["class_id"],
      );

  Map<String, dynamic> toJson() => {
        "class_name": className,
        "class_id": classId,
      };
}
