// To parse this JSON data, do
//
//     final classSubject = classSubjectFromJson(jsonString);

import 'dart:convert';

List<ClassSubject> classSubjectFromJson(String str) => List<ClassSubject>.from(json.decode(str).map((x) => ClassSubject.fromJson(x)));

String classSubjectToJson(List<ClassSubject> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ClassSubjStatus {
  List<ClassSubject> subjData;

  ClassSubjStatus({required this.subjData});

  factory ClassSubjStatus.fromJson(List<dynamic> json) => ClassSubjStatus(
      subjData: json.map((e) => ClassSubject.fromJson(e)).toList());

  get data => null;
}

class ClassSubject {
    String apiStatus;
    List<SubjectDatum> subjectData;

    ClassSubject({
        required this.apiStatus,
        required this.subjectData,
    });

    factory ClassSubject.fromJson(Map<String, dynamic> json) => ClassSubject(
        apiStatus: json["api_status"],
        subjectData: List<SubjectDatum>.from(json["subject_data"].map((x) => SubjectDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "api_status": apiStatus,
        "subject_data": List<dynamic>.from(subjectData.map((x) => x.toJson())),
    };
}

class SubjectDatum {
    String subjectName;
    String subjectId;

    SubjectDatum({
        required this.subjectName,
        required this.subjectId,
    });

    factory SubjectDatum.fromJson(Map<String, dynamic> json) => SubjectDatum(
        subjectName: json["subject_name"],
        subjectId: json["subject_id"],
    );

    Map<String, dynamic> toJson() => {
        "subject_name": subjectName,
        "subject_id": subjectId,
    };
}
