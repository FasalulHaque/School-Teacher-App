// To parse this JSON data, do
//
//     final examMarkIn = examMarkInFromJson(jsonString);

import 'dart:convert';

ExamMarkIn examMarkInFromJson(String str) =>
    ExamMarkIn.fromJson(json.decode(str));

String examMarkInToJson(ExamMarkIn data) => json.encode(data.toJson());

class ExamMarkIn {
  String? student;
  String? teacher;
  String? subject;
  String? exam;
  String? mark;
  String? date;

  ExamMarkIn({
    required this.student,
    required this.teacher,
    required this.subject,
    required this.exam,
    required this.mark,
    required this.date,
  });

  factory ExamMarkIn.fromJson(Map<String, dynamic> json) => ExamMarkIn(
        student: json["student"],
        teacher: json["teacher"],
        subject: json["subject"],
        exam: json["exam"],
        mark: json["mark"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "student": student,
        "teacher": teacher,
        "subject": subject,
        "exam": exam,
        "mark": mark,
        "date": date,
      };
}
