// To parse this JSON data, do
//
//     final studentDetails = studentDetailsFromJson(jsonString);

import 'dart:convert';

List<StudentDetails> studentDetailsFromJson(String str) =>
    List<StudentDetails>.from(
        json.decode(str).map((x) => StudentDetails.fromJson(x)));

String studentDetailsToJson(List<StudentDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentsData {
  List<StudentDetails> profileData;

  StudentsData({required this.profileData});

  factory StudentsData.fromJson(List<dynamic> json) => StudentsData(
      profileData: json.map((e) => StudentDetails.fromJson(e)).toList());
}

class StudentDetails {
  String apiStatus;
  List<StudentDatum> studentData;

  StudentDetails({
    required this.apiStatus,
    required this.studentData,
  });

  factory StudentDetails.fromJson(Map<String, dynamic> json) => StudentDetails(
        apiStatus: json["api_status"],
        studentData: List<StudentDatum>.from(
            json["student_data"].map((x) => StudentDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "api_status": apiStatus,
        "student_data": List<dynamic>.from(studentData.map((x) => x.toJson())),
      };
}

class StudentDatum {
  String? studentFirstname;
  String? studentRollNo;
  String? studentClass;
  String? studentDiv;

  StudentDatum({
    required this.studentFirstname,
    required this.studentRollNo,
    required this.studentClass,
    required this.studentDiv,
  });

  factory StudentDatum.fromJson(Map<String, dynamic> json) => StudentDatum(
        studentFirstname: json["student_firstname"],
        studentRollNo: json["student_roll_no"],
        studentClass: json["student_class"],
        studentDiv: json["student_div"],
      );

  Map<String, dynamic> toJson() => {
        "student_firstname": studentFirstname,
        "student_roll_no": studentRollNo,
        "student_class": studentClass,
        "student_div": studentDiv,
      };
}
