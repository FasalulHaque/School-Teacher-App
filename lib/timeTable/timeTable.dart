import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../drawer/drawer.dart';
import '../services api/timeTableApi/fetch.dart';
import '../services api/timeTableApi/model.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

String? dropdownValue;

String? userid;
Future<String?> getFirmId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userid = await prefs.getString('user_id').toString();
  print(userid);
  return userid;
}

class _TimeTableState extends State<TimeTable> {
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
    var text = GoogleFonts.akshar(
      color: Colors.white,
      fontSize: 15,
    );
    var table = GoogleFonts.akshar(
      color: Colors.black,
      fontSize: 15,
    );
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: DrawerScreen(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 46, 58, 80),
          title: Text(
            'Time Table  ',
            style: GoogleFonts.abel(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: DropdownButtonFormField<String>(
                icon: Padding(
                  padding: EdgeInsets.only(right: width * 0.10),
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
                  'Select Day',
                  style: GoogleFonts.abel(fontSize: 16, color: Colors.black),
                ),
                value: dropdownValue,
                items: <String>[
                  'Monday',
                  'Tuesday',
                  'Wednesday',
                  'Thursday',
                  'Friday',
                ].map<DropdownMenuItem<String>>((String value2) {
                  return DropdownMenuItem<String>(
                    value: value2,
                    child: Text(
                      value2,
                      style: GoogleFonts.abel(fontSize: 15),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            FutureBuilder<TimeTableData>(
                future:
                    timeTableFetch(dropdownValue.toString(), userid.toString()),
                builder: (BuildContext context,
                    AsyncSnapshot<TimeTableData> snapshot) {
                  if (snapshot.hasData) {
                    final data =
                        snapshot.data!.timeData[0].teacherTimetableData;

                    return Expanded(
                      child: Column(
                        children: [
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
                                    'Period',
                                    style: text,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.01),
                                  child: Text(
                                    'Subject',
                                    style: text,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.03),
                                  child: Text(
                                    'Class',
                                    style: text,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Expanded(
                            child: Column(children: [
                              Expanded(
                                  child: ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            tableDetails(
                                                width,
                                                table,
                                                height,
                                                data[index].period,
                                                data[index].subjectName,
                                                data[index].className),
                                          ],
                                        );
                                      })),
                            ]),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: height * 0.33),
                      child: Text(
                        'Not a valid date',
                        style: GoogleFonts.abel(),
                      ),
                    ));
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ));
  }

  Column tableDetails(double width, TextStyle table, double height,
      String period, String subject, String classs) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.03),
              child: Text(
                period,
                style: table,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.01),
              child: Text(
                subject,
                style: table,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.03),
              child: Text(
                classs,
                style: table,
              ),
            ),
          ],
        ),
        Divider(
          height: height * 0.03,
          color: Colors.black,
          thickness: 0.2,
          indent: 5,
          endIndent: 5,
        ),
      ],
    );
  }
}
