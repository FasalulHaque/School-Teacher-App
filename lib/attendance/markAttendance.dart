import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home.dart';
import '../services api/studentAttendance/model.dart';
import '../services api/studentDetailApi/fetch.dart';
import '../services api/studentDetailApi/studeDeModel.dart';

class MarkAttendance extends StatefulWidget {
  MarkAttendance({
    required this.className,
    required this.divi,
    super.key,
  });
  String className;
  String divi;
  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  String valuee = '1';
  static int _len = 10;
  List<bool> isChecked = List.generate(_len, (index) => true);
  List<StudentAttendance> attList = [];

  DateTime now1 = DateTime.now();
  String? userid;
  Future<String?> getFirmId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = await prefs.getString('user_id').toString();
    print(userid);
    return userid;
  }

  Future<bool> sendDataAtt(String dataListt) async {
    String url = 'http://collage.lucidetech.com/api/teacher/attendence_insert';
    var response = await http.post(Uri.parse(url), body: {
      "student_attendence": dataListt,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData[0]["api_status"] == '2') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            " Today Already Attendance Marked",
            style: GoogleFonts.abel(),
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Attendance Mark Successfully",
            style: GoogleFonts.abel(),
          ),
        ));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      }

      print(response.body + '  2342323');
      // var responseData = jsonDecode(response.body);
      // final ress = ExamMarkIn.fromJson(responseData);

      print('Data sent successfully!');
    } else {}
    return false;
  }

  @override
  @override
  void initState() {
    super.initState();
    getFirmId().then((value) {
      setState(() {
        userid = value!;
      });
    });
  }

  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(now1);

    var text = GoogleFonts.akshar(fontSize: 15);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text(
          'Attendance ',
          style: GoogleFonts.abel(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          FutureBuilder<StudentsData>(
            future: fetchdataStudentD(
                widget.className.toString(), widget.divi.toString()),
            builder:
                (BuildContext context, AsyncSnapshot<StudentsData> snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!.profileData[0].studentData;
                if (attList.length > 0) {
                  print('12222222222222');
                } else {
                  for (StudentDatum datum in data) {
                    attList.add(StudentAttendance(
                        student: datum.studentRollNo.toString(),
                        teacher: userid.toString(),
                        date: formattedDate.toString(),
                        attendenceType: valuee.toString()));
                    print(datum.studentRollNo.toString() + '  wert2323232323');
                  }
                }

                return Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child: Text(
                              'Roll No',
                              style: text,
                            ),
                          ),
                          Text(
                            'Student Name',
                            style: text,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.03),
                            child: Text(
                              'Status',
                              style: text,
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: height * 0.03,
                        color: Colors.black,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  // mark(
                                  //   width,
                                  //   text,
                                  //   height,
                                  //   1,
                                  //   data[index].studentFirstname.toString(),
                                  //   data[index].studentRollNo.toString(),
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.03),
                                        child: Text(
                                          data[index].studentRollNo.toString(),
                                          style: text,
                                        ),
                                      ),
                                      Expanded(
                                        child: CheckboxListTile(
                                            value: isChecked[index],
                                            title: Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.12),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.17),
                                                child: Text(
                                                  data[index]
                                                      .studentFirstname
                                                      .toString(),
                                                  style: text,
                                                ),
                                              ),
                                            ),
                                            shape: const CircleBorder(
                                                eccentricity:
                                                    double.minPositive),
                                            checkColor: Colors.white,
                                            activeColor: Colors.redAccent,
                                            onChanged: (bool? val) {
                                              setState(() {
                                                isChecked[index] = val!;

                                                if (val == true) {
                                                  // valuee = '1';
                                                  attList.removeWhere(
                                                      (element) =>
                                                          element.student ==
                                                          data[index]
                                                              .studentRollNo);
                                                  StudentAttendance list1 =
                                                      StudentAttendance(
                                                          student: data[index]
                                                              .studentRollNo
                                                              .toString(),
                                                          teacher:
                                                              userid.toString(),
                                                          date: formattedDate
                                                              .toString(),
                                                          attendenceType: '1');
                                                  attList.add(list1);
                                                  // print(attList[index]
                                                  //         .student
                                                  //         .toString() +
                                                  //     '            checked');
                                                } else {
                                                  // valuee = '0';
                                                  attList.removeWhere(
                                                      (element) =>
                                                          element.student ==
                                                          data[index]
                                                              .studentRollNo);
                                                  StudentAttendance list2 =
                                                      StudentAttendance(
                                                          student: data[index]
                                                              .studentRollNo
                                                              .toString(),
                                                          teacher:
                                                              userid.toString(),
                                                          date: formattedDate
                                                              .toString(),
                                                          attendenceType: '0');

                                                  attList.add(list2);
                                                  // print(attList[index]
                                                  //         .student
                                                  //         .toString() +
                                                  //     '            unchecked');
                                                }
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: height * 0.01,
                                    color: Colors.black,
                                    thickness: 0.3,
                                    indent: 5,
                                    endIndent: 5,
                                  ),
                                ],
                              );
                            }),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: height * 0.05,
                            width: width * 0.44,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.07,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red.withOpacity(0.8),
                                ),
                                child: Text(
                                  'CANCEL',
                                  style: GoogleFonts.actor(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                            width: width * 0.06,
                          ),
                          SizedBox(
                            height: height * 0.05,
                            width: width * 0.44,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.03,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  print(formattedDate.toString() +
                                      '       dateeeeeee');
                                  List<Map<String, dynamic>> listt = attList
                                      .map((data) => data.toJson())
                                      .toList();
                                  String jsonString = jsonEncode(listt);

                                  sendDataAtt(jsonString);
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(SnackBar(
                                  //   content: Text(
                                  //     'Attendance Mark Successfully',
                                  //     style: GoogleFonts.abel(),
                                  //   ),
                                  // ));

                                  print(jsonString.toString() +
                                      '                11111111111111111');
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red.withOpacity(0.8),
                                ),
                                child: Text(
                                  'SUBMIT',
                                  style: GoogleFonts.actor(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: height * 0.42),
                  child: Text(
                    "Not a valid date ",
                    style: GoogleFonts.abel(),
                  ),
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),

      //  ListView(
      //   children: [
      //     SizedBox(
      //       height: height * 0.03,
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Padding(
      //           padding: EdgeInsets.only(left: width * 0.03),
      //           child: Text(
      //             'Roll No',
      //             style: text,
      //           ),
      //         ),
      //         Text(
      //           'Student Name',
      //           style: text,
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(right: width * 0.03),
      //           child: Text(
      //             'Status',
      //             style: text,
      //           ),
      //         )
      //       ],
      //     ),
      //     Divider(
      //       height: height * 0.03,
      //       color: Colors.black,
      //       thickness: 1,
      //       indent: 5,
      //       endIndent: 5,
      //     ),
      //     mark(width, text, height, 1),
      //     mark(width, text, height, 2),
      //     mark(width, text, height, 3),
      //     mark(width, text, height, 4),
      //     mark(width, text, height, 5),
      //     mark(width, text, height, 6),
      //     mark(width, text, height, 7),
      //     SizedBox(
      //       height: height * 0.04,
      //     ),

      //   ],
      // ),
    );
  }

  Column mark(double width, TextStyle text, double height, int check,
      String stName, String rollNo) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.03),
              child: Text(
                rollNo,
                style: text,
              ),
            ),
            Expanded(
              child: CheckboxListTile(
                  value: isChecked[check],
                  title: Padding(
                    padding: EdgeInsets.only(left: width * 0.12),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.17),
                      child: Text(
                        stName,
                        style: text,
                      ),
                    ),
                  ),
                  shape: const CircleBorder(eccentricity: double.minPositive),
                  checkColor: Colors.white,
                  activeColor: Colors.redAccent,
                  onChanged: (bool? val) {
                    setState(() {
                      isChecked[check] = val!;
                    });
                  }),
            ),
          ],
        ),
        Divider(
          height: height * 0.01,
          color: Colors.black,
          thickness: 0.3,
          indent: 5,
          endIndent: 5,
        ),
      ],
    );
  }
}
