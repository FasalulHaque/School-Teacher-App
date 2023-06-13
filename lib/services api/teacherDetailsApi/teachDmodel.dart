// To parse this JSON data, do
//
//     final profileDetailsApi = profileDetailsApiFromJson(jsonString);

import 'dart:convert';

List<ProfileDetailsApi> profileDetailsApiFromJson(String str) =>
    List<ProfileDetailsApi>.from(
        json.decode(str).map((x) => ProfileDetailsApi.fromJson(x)));

String profileDetailsApiToJson(List<ProfileDetailsApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileData {
  List<ProfileDetailsApi> profileData;

  ProfileData({required this.profileData});

  factory ProfileData.fromJson(List<dynamic> json) => ProfileData(
      profileData: json.map((e) => ProfileDetailsApi.fromJson(e)).toList());
}

class ProfileDetailsApi {
  String apiStatus;
  List<TeacherDetailsDatum> teacherDetailsData;

  ProfileDetailsApi({
    required this.apiStatus,
    required this.teacherDetailsData,
  });

  factory ProfileDetailsApi.fromJson(Map<String, dynamic> json) =>
      ProfileDetailsApi(
        apiStatus: json["api_status"],
        teacherDetailsData: List<TeacherDetailsDatum>.from(
            json["teacher_details_data"]
                .map((x) => TeacherDetailsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "api_status": apiStatus,
        "teacher_details_data":
            List<dynamic>.from(teacherDetailsData.map((x) => x.toJson())),
      };
}

class TeacherDetailsDatum {
  String? teacherId;
  String? teacherUserId;
  String? teacherName;
  String? teacherAddress;
  String? teacherMob;
  String? teacherEmail;
  String? teacherStatus;
  String? teacherDob;

  TeacherDetailsDatum({
    required this.teacherId,
    required this.teacherUserId,
    required this.teacherName,
    required this.teacherAddress,
    required this.teacherMob,
    required this.teacherEmail,
    required this.teacherStatus,
    required this.teacherDob,
  });

  factory TeacherDetailsDatum.fromJson(Map<String, dynamic> json) =>
      TeacherDetailsDatum(
          teacherId: json["teacher_id"],
          teacherUserId: json["teacher_user_id"],
          teacherName: json["teacher_name"],
          teacherAddress: json["teacher_address"],
          teacherMob: json["teacher_mob"],
          teacherEmail: json["teacher_email"],
          teacherStatus: json["teacher_status"],
          teacherDob: json["teacher_dob"]);

  Map<String, dynamic> toJson() => {
        "teacher_id": teacherId,
        "teacher_user_id": teacherUserId,
        "teacher_name": teacherName,
        "teacher_address": teacherAddress,
        "teacher_mob": teacherMob,
        "teacher_email": teacherEmail,
        "teacher_status": teacherStatus,
        "teacher_dob": teacherDob
      };
}
