// To parse this JSON data, do
//
//     final timeTableApi = timeTableApiFromJson(jsonString);

import 'dart:convert';

List<TimeTableApi> timeTableApiFromJson(String str) => List<TimeTableApi>.from(
    json.decode(str).map((x) => TimeTableApi.fromJson(x)));

String timeTableApiToJson(List<TimeTableApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimeTableData {
  List<TimeTableApi> timeData;

  TimeTableData({required this.timeData});

  factory TimeTableData.fromJson(List<dynamic> json) => TimeTableData(
      timeData: json.map((e) => TimeTableApi.fromJson(e)).toList());

  get data => null;
}

class TimeTableApi {
  String apiStatus;
  List<TeacherTimetableDatum> teacherTimetableData;

  TimeTableApi({
    required this.apiStatus,
    required this.teacherTimetableData,
  });

  factory TimeTableApi.fromJson(Map<String, dynamic> json) => TimeTableApi(
        apiStatus: json["api_status"],
        teacherTimetableData: List<TeacherTimetableDatum>.from(
            json["teacher_timetable__data"]
                .map((x) => TeacherTimetableDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "api_status": apiStatus,
        "teacher_timetable__data":
            List<dynamic>.from(teacherTimetableData.map((x) => x.toJson())),
      };
}

class TeacherTimetableDatum {
  String subjectName;
  String startTime;
  String endTime;
  String period;
  String className;
  String divName;
  String dayName;

  TeacherTimetableDatum({
    required this.subjectName,
    required this.startTime,
    required this.endTime,
    required this.period,
    required this.className,
    required this.divName,
    required this.dayName,
  });

  factory TeacherTimetableDatum.fromJson(Map<String, dynamic> json) =>
      TeacherTimetableDatum(
        subjectName: json["subject_name"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        period: json["period"],
        className: json["class_name"],
        divName: json["div_name"],
        dayName: json["day_name"],
      );

  Map<String, dynamic> toJson() => {
        "subject_name": subjectName,
        "start_time": startTime,
        "end_time": endTime,
        "period": period,
        "class_name": className,
        "div_name": divName,
        "day_name": dayName,
      };
}
