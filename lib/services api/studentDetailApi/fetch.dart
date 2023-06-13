import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:school_teacher/services%20api/studentDetailApi/studeDeModel.dart';

Future<StudentsData> fetchdataStudentD(
  String classs,
  String div,
) async {
  final response = await http.post(
      Uri.parse('http://collage.lucidetech.com/api/student/student_list'),
      body: {"class": classs, "div": div});

  // print(response.body.toString() + '     243433353535');
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final ress = StudentsData.fromJson(responseData);

    // print(StudentsData.fromJson(jsonDecode(response.body)).profileData[0].teacherDetailsData.length.toString() + '             lll----lllllllllllll0');

    return ress;
  } else {
    throw Exception('Failed to load data');
  }
}
