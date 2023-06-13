import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

Future<ClassSubjStatus> subjectFetch() async {
  final response = await http.post(
    Uri.parse('http://collage.lucidetech.com/api/teacher/subject_list'),
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
//  print(response.body.toString()+"       ggggggggggggggg");
    final ress = ClassSubjStatus.fromJson(responseData);
    // print(ress.numberData[0].classData[2].className.toString()+"       jjjjj");

    return ress;
  } else {
    throw Exception('Failed to load data');
  }
}
