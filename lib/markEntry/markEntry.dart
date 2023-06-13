import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:school_teacher/services%20api/ClassSubjectApi/fetch.dart';
import 'package:school_teacher/services%20api/ClassSubjectApi/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../drawer/drawer.dart';
import '../home/home.dart';
import '../services api/ExamNameApi/fetch.dart';
import '../services api/ExamNameApi/model.dart';
import '../services api/classDivsApi/fetch.dart';
import '../services api/classDivsApi/model.dart';
import '../services api/classNumberApi/fetch.dart';
import '../services api/classNumberApi/model.dart';
import '../services api/examMarkInsert/model.dart';
import '../services api/studentDetailApi/fetch.dart';
import '../services api/studentDetailApi/studeDeModel.dart';
import 'package:http/http.dart' as http;

class MarkEntry extends StatefulWidget {
  const MarkEntry({super.key});

  @override
  State<MarkEntry> createState() => _MarkEntryState();
}

class _MarkEntryState extends State<MarkEntry> {
  List<ClassDatum> list_class = [];
  List<DivisionDatum> divList = [];
  List<SubjectDatum> subjectList = [];
  List<ExamDatum> examList = [];

  String? dropdownValue;
  String? dropdownValue1;
  String? dropdownValue2;
  String? dropdownValue3;

  String? dropdownid;
  String? dropdownid1;
  String? dropdownid2;
  String? dropdownid3;

  ClassDatum classDatum = ClassDatum(className: "0", classId: "0");
  DivisionDatum divisionDatum = DivisionDatum(divName: "A", divId: "0");
  SubjectDatum subjectDatum =
      SubjectDatum(subjectId: "1", subjectName: "Malayalam");
  ExamDatum examDatum = ExamDatum(examId: "0", examName: "0");
  final _formKey = GlobalKey<FormState>();

  List<TextEditingController> _controllers = [];
  final TextEditingController nameContll = TextEditingController();
  String? markk;
  List list22 = [];
  String? userid;
  Future<String?> getFirmId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = await prefs.getString('user_id').toString();
    print(userid);
    return userid;
  }

  final Text122 = '2222';

  @override
  void initState() {
    super.initState();
    getData();
    divData();
    subjectData();
    examData();
    getFirmId().then((value) {
      setState(() {
        userid = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var text = GoogleFonts.akshar(
      color: Colors.white,
      fontSize: 15,
    );
    var font = GoogleFonts.akshar(
      color: Colors.black,
      fontSize: 15,
    );

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    List<ExamMarkIn> dataList = [];
    List list1213 = [];

    Future<bool> sendData(String dataList) async {
      String url = 'http://collage.lucidetech.com/api/teacher/exam_mark_insert';
      var response = await http.post(Uri.parse(url), body: {
        "exam_mark": dataList,
      });
      print(dataList);
      if (response.statusCode == 200) {
        print(response.body);
        // var responseData = jsonDecode(response.body);
        // final ress = ExamMarkIn.fromJson(responseData);

        print('Data sent successfully!');
      } else {}
      return false;
    }

    String idd = '0';
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        drawer: const DrawerScreen(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 46, 58, 80),
          title: Text(
            'Mark Entry',
            style: GoogleFonts.abel(color: Colors.white),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: DropdownButtonFormField<ClassDatum>(
                        icon: Padding(
                          padding: EdgeInsets.only(right: width * 0.06),
                          child: const Icon(Icons.arrow_drop_down),
                        ),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                        elevation: 0,
                        hint: Text(
                          'Select Class',
                          style: GoogleFonts.abel(
                              fontSize: 16, color: Colors.black),
                        ),
                        items: list_class.map((ClassDatum value) {
                          return DropdownMenuItem<ClassDatum>(
                            value: value,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: Text(
                                value.className.toString(),
                                style: GoogleFonts.abel(fontSize: 15),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (ClassDatum? newValue) {
                          setState(() {
                            dropdownValue = newValue!.className;
                            dropdownid = newValue.classId;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.08),
                      child: DropdownButtonFormField<DivisionDatum>(
                          icon: Padding(
                            padding: EdgeInsets.only(right: width * 0.00),
                            child: const Icon(Icons.arrow_drop_down),
                          ),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                          elevation: 0,
                          hint: Text(
                            'Select Division ',
                            style: GoogleFonts.abel(
                                fontSize: 16, color: Colors.black),
                          ),
                          items: divList.map((DivisionDatum value1) {
                            return DropdownMenuItem<DivisionDatum>(
                              value: value1,
                              child: Text(
                                value1.divName,
                                style: GoogleFonts.abel(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (DivisionDatum? newValue) {
                            setState(() {
                              dropdownValue1 = newValue!.divName;
                              dropdownid1 = newValue.divId;
                            });
                          }),
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: width * 0.06),
                    child: DropdownButtonFormField<SubjectDatum>(
                      icon: Padding(
                        padding: EdgeInsets.only(left: width * 0.00),
                        child: const Icon(Icons.arrow_drop_down),
                      ),
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      elevation: 0,
                      hint: Padding(
                        padding: EdgeInsets.only(left: width * 0.04),
                        child: Text(
                          'Select Subject',
                          style: GoogleFonts.abel(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                      items: subjectList.map((SubjectDatum value) {
                        return DropdownMenuItem<SubjectDatum>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: Text(
                              value.subjectName,
                              style: GoogleFonts.abel(fontSize: 15),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (SubjectDatum? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!.subjectName;
                          dropdownid2 = newValue.subjectId;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: DropdownButtonFormField<ExamDatum>(
                      icon: Padding(
                        padding: EdgeInsets.only(right: width * 0.00),
                        child: const Icon(Icons.arrow_drop_down),
                      ),
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      elevation: 0,
                      hint: Padding(
                        padding: EdgeInsets.only(left: width * 0.03),
                        child: Text(
                          'Select Exam',
                          style: GoogleFonts.abel(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                      items: examList.map((ExamDatum value) {
                        return DropdownMenuItem<ExamDatum>(
                          value: value,
                          child: Text(
                            value.examName,
                            style: GoogleFonts.abel(fontSize: 15),
                          ),
                        );
                      }).toList(),
                      onChanged: (ExamDatum? newValue) {
                        setState(() {
                          dropdownValue3 = newValue!.examName;
                          dropdownid3 = newValue.examId;
                        });
                      },
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.07,
                width: width * 0.98,
                color: Colors.red.withOpacity(0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.03),
                      child: Text(
                        'Roll No',
                        style: text,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.13),
                      child: Text(
                        'Name',
                        style: text,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.03),
                      child: Text(
                        'Mark',
                        style: text,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<StudentsData>(
                  future: fetchdataStudentD(
                      dropdownValue.toString(), dropdownValue1.toString()),
                  builder: (BuildContext context,
                      AsyncSnapshot<StudentsData> snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!.profileData[0].studentData;
                      return Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      _controllers.add(TextEditingController());

                                      // dataList.add(ExamMarkIn(
                                      //   student:
                                      //       data[index].studentRollNo.toString(),
                                      //   teacher: '2',
                                      //   subject: dropdownid3.toString(),
                                      //   exam: dropdownid2.toString(),
                                      //   mark: _controllers[index].text,
                                      //   date: formattedDate.toString(),
                                      // ));

                                      return Stack(children: [
                                        markDetil(
                                          width,
                                          font,
                                          height,
                                          data[index]
                                              .studentFirstname
                                              .toString(),
                                          data[index].studentRollNo.toString(),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.75,
                                              right: width * 0.03,
                                              bottom: height * 0,
                                              top: width * 0.01),
                                          child: SizedBox(
                                            height: height * 0.05,
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Enter Mark';
                                                }
                                                return null;
                                              },
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    3),
                                              ],
                                              controller: _controllers[index],
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color:
                                                          const Color.fromARGB(
                                                                  255,
                                                                  142,
                                                                  131,
                                                                  131)
                                                              .withOpacity(
                                                                  0.6)),
                                                ),
                                                hintStyle: GoogleFonts.abel(
                                                    color: Colors.black,
                                                    letterSpacing: 1.2,
                                                    fontSize: 14),
                                              ),
                                              onSaved: (newValue) {
                                                // if (dataList.length > 0) {
                                                //   print(
                                                //       '12222222222222-..............-');
                                                // } else {
                                                //   for (StudentDatum datum
                                                //       in data) {
                                                //     dataList.add(ExamMarkIn(
                                                //      student: datum.studentRollNo
                                                //           .toString(),
                                                //       teacher: '2',
                                                //       subject:
                                                //           dropdownid3.toString(),
                                                //       exam:
                                                //           dropdownid2.toString(),
                                                //       mark: _controllers[index]
                                                //           .text,
                                                //       date: formattedDate
                                                //           .toString(),
                                                //     ));
                                                //   }
                                                // }
                                                dataList.add(ExamMarkIn(
                                                  student: data[index]
                                                      .studentRollNo
                                                      .toString(),
                                                  teacher: userid.toString(),
                                                  subject:
                                                      dropdownid2.toString(),
                                                  exam: dropdownid3.toString(),
                                                  mark:
                                                      _controllers[index].text,
                                                  date:
                                                      formattedDate.toString(),
                                                ));
                                              },
                                            ),
                                          ),
                                        ),
                                      ]);
                                    })),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            SizedBox(
                              height: height * 0.05,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.09,
                                  right: width * 0.09,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // if (dataList.length > 0) {
                                    //   print('12222222222222-..............-');
                                    // } else {
                                    //   for (StudentDatum datum in data) {
                                    //     dataList.add(ExamMarkIn(
                                    //       student: datum.studentRollNo.toString(),
                                    //       teacher: '2',
                                    //       subject: dropdownid3.toString(),
                                    //       exam: dropdownid2.toString(),
                                    //       mark: _controllers[3].text,
                                    //       date: formattedDate.toString(),
                                    //     ));
                                    //   }
                                    // }
                                    if (_formKey.currentState!.validate()) {
                                      if (dropdownValue3 == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'Select Exam',
                                            style: GoogleFonts.abel(),
                                          ),
                                        ));
                                      } else if (dropdownValue2 == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'Select Subject',
                                            style: GoogleFonts.abel(),
                                          ),
                                        ));
                                      } else {
                                        _formKey.currentState!.save();
                                        List<Map<String, dynamic>> list =
                                            dataList
                                                .map((data) => data.toJson())
                                                .toList();
                                        String jsonString = jsonEncode(list);

                                        sendData(jsonString);
                                        print(jsonString.toString() +
                                            '             551234567890String');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'Mark Updated Successfully',
                                            style: GoogleFonts.abel(),
                                          ),
                                        ));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ));
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.9),
                                  ),
                                  child: Text(
                                    'SAVE/UPDATE',
                                    style: GoogleFonts.actor(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: height * 0.33),
                      child: Text(
                        "Not a valid date",
                        style: GoogleFonts.abel(),
                      ),
                    ));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Column markDetil(
    double width,
    TextStyle text,
    double height,
    String name,
    String rollNo,
  ) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.03),
              child: Text(
                rollNo,
                style: text,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.37),
              child: Text(
                name,
                style: text,
              ),
            ),

            // Padding(
            //     padding: EdgeInsets.only(right: width * 0.03),
            //     child: SizedBox(
            //         width: width * 0.06,
            //         height: height * 0.06,
            //         child: Text(
            //           mark,
            //           style: text,
            //         ))),
          ],
        ),
        Divider(
          height: height * 0.06,
          color: Colors.black,
          thickness: 0.2,
          indent: 5,
          endIndent: 5,
        ),
      ],
    );
  }

  Future<bool> getData() async {
    final res = await numberFetch();
    print(res.toString() + "         lkjsssss");
    print(res.numberData[0].classData);
    if (res.numberData[0].classData.isNotEmpty) {
      setState(() {
        print(classDatum.className + "       llkddd");
        list_class.addAll(res.numberData[0].classData);
        classDatum = res.numberData[0].classData[0];
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> divData() async {
    final res = await divFetch();
    // print(res.toString() + "         lkjsssss");
    // print(res.numberData[0].classData);
    if (res.divData[0].divisionData.isNotEmpty) {
      setState(() {
        // print(classDatum.className + "       llkddd");
        divList.addAll(res.divData[0].divisionData);
        divisionDatum = res.divData[0].divisionData[0];
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> subjectData() async {
    final res = await subjectFetch();
    // print(res.toString() + "         lkjsssss");
    // print(res.numberData[0].classData);
    if (res.subjData[0].subjectData.isNotEmpty) {
      setState(() {
        // print(classDatum.className + "       llkddd");
        subjectList.addAll(res.subjData[0].subjectData);
        subjectDatum = res.subjData[0].subjectData[0];
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> examData() async {
    final res = await examFetch();
    // print(res.toString() + "         lkjsssss");
    // print(res.numberData[0].classData);
    if (res.examData[0].examData.isNotEmpty) {
      setState(() {
        // print(classDatum.className + "       llkddd");
        examList.addAll(res.examData[0].examData);
        examDatum = res.examData[0].examData[0];
      });
      return true;
    } else {
      return false;
    }
  }
}
