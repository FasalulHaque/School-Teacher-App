// To parse this JSON data, do
//
//     final examName = examNameFromJson(jsonString);

import 'dart:convert';

List<ExamName> examNameFromJson(String str) => List<ExamName>.from(json.decode(str).map((x) => ExamName.fromJson(x)));

String examNameToJson(List<ExamName> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassExamStatus {
  List<ExamName> examData;

  ClassExamStatus({required this.examData});

  factory ClassExamStatus.fromJson(List<dynamic> json) => ClassExamStatus(
      examData: json.map((e) => ExamName.fromJson(e)).toList());

  get data => null;
}

class ExamName {
    String apiStatus;
    List<ExamDatum> examData;

    ExamName({
        required this.apiStatus,
        required this.examData,
    });

    factory ExamName.fromJson(Map<String, dynamic> json) => ExamName(
        apiStatus: json["api_status"],
        examData: List<ExamDatum>.from(json["exam_data"].map((x) => ExamDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "api_status": apiStatus,
        "exam_data": List<dynamic>.from(examData.map((x) => x.toJson())),
    };
}

class ExamDatum {
    String examName;
    String examId;

    ExamDatum({
        required this.examName,
        required this.examId,
    });

    factory ExamDatum.fromJson(Map<String, dynamic> json) => ExamDatum(
        examName: json["exam_name"],
        examId: json["exam_id"],
    );

    Map<String, dynamic> toJson() => {
        "exam_name": examName,
        "exam_id": examId,
    };
}
