
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'teachDmodel.dart';

Future<ProfileData> fetchdata(
  String user_id,
) async {
  final response = await http.post(
      Uri.parse('http://collage.lucidetech.com/api/teacher/teacher_details'),
      body: {"user_id": user_id});

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final ress=ProfileData.fromJson(responseData);


    print(ProfileData.fromJson(jsonDecode(response.body)).profileData[0].teacherDetailsData.length.toString() + '             lll----lllllllllllll0');
   
    return ProfileData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
