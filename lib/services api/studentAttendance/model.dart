// To parse this JSON data, do
//
//     final studentAttendance = studentAttendanceFromJson(jsonString);

import 'dart:convert';

StudentAttendance studentAttendanceFromJson(String str) => StudentAttendance.fromJson(json.decode(str));

String studentAttendanceToJson(StudentAttendance data) => json.encode(data.toJson());

class StudentAttendance {
    String student;
    String teacher;
    String date;
    String attendenceType;

    StudentAttendance({
        required this.student,
        required this.teacher,
        required this.date,
        required this.attendenceType,
    });

    factory StudentAttendance.fromJson(Map<String, dynamic> json) => StudentAttendance(
        student: json["student"],
        teacher: json["teacher"],
        date: json["date"],
        attendenceType: json["attendence_type"],
    );

    Map<String, dynamic> toJson() => {
        "student": student,
        "teacher": teacher,
        "date": date,
        "attendence_type": attendenceType,
    };
}
