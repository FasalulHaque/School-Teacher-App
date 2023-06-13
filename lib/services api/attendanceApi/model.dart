// To parse this JSON data, do
//
//     final attendanceDetails = attendanceDetailsFromJson(jsonString);

import 'dart:convert';

List<AttendanceDetails> attendanceDetailsFromJson(String str) =>
    List<AttendanceDetails>.from(
        json.decode(str).map((x) => AttendanceDetails.fromJson(x)));

String attendanceDetailsToJson(List<AttendanceDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceData {
  List<AttendanceDetails> attttd;

  AttendanceData({required this.attttd});

  factory AttendanceData.fromJson(List<dynamic> json) => AttendanceData(
      attttd: json.map((e) => AttendanceDetails.fromJson(e)).toList());
}

class AttendanceDetails {
  String status;
  String message;
  String apiStatus;

  AttendanceDetails({
    required this.status,
    required this.message,
    required this.apiStatus,
  });

  factory AttendanceDetails.fromJson(Map<String, dynamic> json) =>
      AttendanceDetails(
        status: json["status"],
        message: json["message"],
        apiStatus: json["api_status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "api_status": apiStatus,
      };
}
