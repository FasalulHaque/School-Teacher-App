import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

Future<AttendanceData> attfetchdata(
  String student,
  String teacher,
  String date,
  String attendence_type,
) async {
  final response = await http.post(
      Uri.parse('http://collage.lucidetech.com/api/teacher/attendence_insert'),
      body: {
        "student": student,
        "teacher": teacher,
        "date": date,
        "attendence_type": attendence_type
      });

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final ress = AttendanceData.fromJson(responseData);

    print(AttendanceData.fromJson(jsonDecode(response.body))
            .attttd[0]
            .apiStatus
            .length
            .toString() +
        '             lll----lllllllldddddllllllllll0');

    return AttendanceData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
