// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import 'model.dart';

// Future<ExamMarkIn> insertMark(
//   List list,
// ) async {
//   final response = await http.post(
//       Uri.parse('http://collage.lucidetech.com/api/teacher/exam_mark_insert'),
//       body: {"exam_mark": list});

//   if (response.statusCode == 200) {
//     final responseData = jsonDecode(response.body);
//     final ress = ExamMarkIn.fromJson(responseData);

//     // print(StudentsData.fromJson(jsonDecode(response.body)).profileData[0].teacherDetailsData.length.toString() + '             lll----lllllllllllll0');

//     return ress;
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
