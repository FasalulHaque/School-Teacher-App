import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/drawer.dart';
import '../services api/classDivsApi/fetch.dart';
import '../services api/classDivsApi/model.dart';
import '../services api/classNumberApi/fetch.dart';
import '../services api/classNumberApi/model.dart';
import '../services api/studentDetailApi/fetch.dart';
import '../services api/studentDetailApi/studeDeModel.dart';
import 'markAttendance.dart';

class Attendance extends StatefulWidget {
  Attendance({
    super.key,
  });

  @override
  State<Attendance> createState() => _AttendanceState();
}

// StudentsData? studentsData;
// List<StudentsData> list = [];

class _AttendanceState extends State<Attendance> {
  List<ClassDatum> list_class = [];
  List<DivisionDatum> divList = [];

  ClassDatum classDatum = ClassDatum(className: "0", classId: "0");
  DivisionDatum divisionDatum = DivisionDatum(divName: "A", divId: "0");

  String? dropdownValue;
  String? dropdownValue1;
  String? studentFirstname;
  String? dropdownid;
  String? dropdownid1;
  String? dropdownid2;
  String? dropdownid3;
  @override
  void initState() {
    super.initState();
    getData();
    divData();
  }

  @override
  Widget build(BuildContext context) {
    var text = GoogleFonts.akshar();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text(
          'Attendance',
          style: GoogleFonts.abel(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       child: Padding(
          //         padding: EdgeInsets.only(left: width * 0.05),
          //         child: DropdownButtonFormField<String>(
          //           icon: Padding(
          //             padding: EdgeInsets.only(right: width * 0.10),
          //             child: const Icon(Icons.arrow_drop_down),
          //           ),
          //           decoration: InputDecoration(
          //             enabledBorder: const UnderlineInputBorder(
          //                 borderSide: BorderSide(color: Colors.white)),
          //             focusedBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(5),
          //               borderSide: const BorderSide(color: Colors.white),
          //             ),
          //           ),
          //           elevation: 0,
          //           hint: Text(
          //             'Select Class',
          //             style:
          //                 GoogleFonts.abel(fontSize: 16, color: Colors.black),
          //           ),
          //           value: dropdownValue,
          //           items: <String>[
          //             '1',
          //             '2',
          //             '3',
          //             '4',
          //             '5',
          //             '6',
          //             '7',
          //             '8',
          //             '9',
          //             '10'
          //           ].map<DropdownMenuItem<String>>((String value) {
          //             return DropdownMenuItem<String>(
          //               value: value,
          //               child: Text(
          //                 value,
          //                 style: GoogleFonts.abel(fontSize: 15),
          //               ),
          //             );
          //           }).toList(),
          //           onChanged: (String? newValue) {
          //             setState(() {
          //               dropdownValue = newValue!;
          //               // if ('1' == true) {
          //               //   fetchdataStudentD('1', 'A');

          //               //   setState(() {
          //               //     fetchdataStudentD('1', 'A');
          //               //   });
          //               // } else {}
          //             });
          //           },
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Padding(
          //         padding: EdgeInsets.only(left: width * 0.10),
          //         child: DropdownButtonFormField<String>(
          //             icon: const Icon(Icons.arrow_drop_down),
          //             decoration: InputDecoration(
          //               enabledBorder: const UnderlineInputBorder(
          //                   borderSide: BorderSide(color: Colors.white)),
          //               focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(5),
          //                 borderSide: const BorderSide(color: Colors.white),
          //               ),
          //             ),
          //             elevation: 0,
          //             hint: Text(
          //               'Select Division ',
          //               style:
          //                   GoogleFonts.abel(fontSize: 16, color: Colors.black),
          //             ),
          //             value: dropdownValue1,
          //             items: <String>[
          //               'A',
          //               'B',
          //               'C',
          //               'D',
          //               'E',
          //               'F',
          //             ].map<DropdownMenuItem<String>>((String value1) {
          //               return DropdownMenuItem<String>(
          //                 value: value1,
          //                 child: Text(
          //                   value1,
          //                   style: GoogleFonts.abel(fontSize: 15),
          //                 ),
          //               );
          //             }).toList(),
          //             onChanged: (String? newValue) {
          //               setState(() {
          //                 dropdownValue1 = newValue!;

          //                 // if ('A' == true) {
          //                 //   fetchdataStudentD('1', 'A');

          //                 //   setState(() {
          //                 //     fetchdataStudentD('1', 'A');
          //                 //   });
          //                 // } else if ('B' == true) {
          //                 //   fetchdataStudentD('1', 'B');

          //                 //   setState(() {
          //                 //     fetchdataStudentD('1', 'B');
          //                 //   });
          //                 // } else if ('C' == true) {
          //                 //   fetchdataStudentD('1', 'C');

          //                 //   setState(() {
          //                 //     fetchdataStudentD('1', 'C');
          //                 //   });
          //                 // }
          //                 // else if ('D' == true) {
          //                 //   fetchdataStudentD('1', 'D');

          //                 //   setState(() {
          //                 //     fetchdataStudentD('1', 'D');
          //                 //   });
          //                 // }
          //                 // else if ('E' == true) {
          //                 //   fetchdataStudentD('1', 'E');

          //                 //   setState(() {
          //                 //     fetchdataStudentD('1', 'E');
          //                 //   });
          //                 // }
          //                 // else if ('F' == true) {
          //                 //   fetchdataStudentD('1', 'F');

          //                 //   setState(() {
          //                 //     fetchdataStudentD('1', 'F');
          //                 //   });
          //                 // }
          //               });
          //             }),
          //       ),
          //     ),
          //   ],
          // ),
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
                      style:
                          GoogleFonts.abel(fontSize: 16, color: Colors.black),
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
                        style:
                            GoogleFonts.abel(fontSize: 16, color: Colors.black),
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
          SizedBox(
            height: height * 0.04,
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MarkAttendance(
                            className: dropdownValue.toString(),
                            divi: dropdownValue1.toString()),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent.withOpacity(0.9),
                ),
                child: Text(
                  'Mark Attendance',
                  style: GoogleFonts.actor(),
                ),
              ),
            ),
          ),
          Divider(
            height: height * 0.04,
            color: Colors.blue,
            thickness: 3,
            indent: 5,
            endIndent: 5,
          ),
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
                  'Presence',
                  style: text,
                ),
              )
            ],
          ),
          Divider(
            height: height * 0.02,
            color: Colors.black,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          FutureBuilder<StudentsData>(
            future: fetchdataStudentD(
                dropdownValue.toString(), dropdownValue1.toString()),
            builder:
                (BuildContext context, AsyncSnapshot<StudentsData> snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!.profileData[0].studentData;
                return Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            attendanceDetil(
                                width,
                                text,
                                height,
                                data[index].studentFirstname.toString(),
                                data[index].studentRollNo.toString()),
                          ],
                        );
                      }),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: height * 0.33),
                  child: Text(
                    "Not a valid date",
                    style: GoogleFonts.abel(),
                  ),
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Column attendanceDetil(
      double width, TextStyle text, double height, String name, String rollNo) {
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
            Padding(
              padding: EdgeInsets.only(left: width * 0.01),
              child: Text(
                name,
                style: text,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: width * 0.03),
                child: SizedBox(
                    width: width * 0.06,
                    height: height * 0.06,
                    child: Image.asset(
                        'assets/image/imgbin-check-mark-tick-green-tick-mark-green-check-5PCaaZHHqqy522q5v3ts3XyeG-transformed.png'))),
          ],
        ),
        Divider(
          height: height * 0.01,
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
}
