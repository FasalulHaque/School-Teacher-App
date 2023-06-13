import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/drawer.dart';

class MarkReport extends StatefulWidget {
  const MarkReport({super.key});

  @override
  State<MarkReport> createState() => _MarkReportState();
}

class _MarkReportState extends State<MarkReport> {
  String? dropdownValue;
  String? dropdownValue1;
  String? dropdownValue2;
  String? dropdownValue3;
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text(
          'Mark Report',
          style: GoogleFonts.abel(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: DropdownButtonFormField<String>(
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
                    value: dropdownValue,
                    items: <String>[
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                      '6',
                      '7',
                      '8',
                      '9',
                      '10'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.04),
                          child: Text(
                            value,
                            style: GoogleFonts.abel(fontSize: 15),
                          ),
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
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.10),
                  child: DropdownButtonFormField<String>(
                      icon: const Icon(Icons.arrow_drop_down),
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
                      value: dropdownValue1,
                      items: <String>[
                        'A',
                        'B',
                        'C',
                        'D',
                        'E',
                        'F',
                      ].map<DropdownMenuItem<String>>((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(
                            value1,
                            style: GoogleFonts.abel(fontSize: 15),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue1 = newValue!;
                        });
                      }),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: DropdownButtonFormField<String>(
                    icon: Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
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
                      'Select Exam',
                      style:
                          GoogleFonts.abel(fontSize: 16, color: Colors.black),
                    ),
                    value: dropdownValue2,
                    items: <String>[
                      'Onam Exam',
                      'Christmas Exam ',
                      'Model Exam',
                      'Public Exam',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.abel(fontSize: 15),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.10),
                  child: DropdownButtonFormField<String>(
                      icon: const Icon(Icons.arrow_drop_down),
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
                        'Select Subject ',
                        style:
                            GoogleFonts.abel(fontSize: 16, color: Colors.black),
                      ),
                      value: dropdownValue3,
                      items: <String>[
                        'Malayalam',
                        'Hindi',
                        'English',
                        'Mathematics',
                        'Science',
                      ].map<DropdownMenuItem<String>>((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(
                            value1,
                            style: GoogleFonts.abel(fontSize: 15),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue3 = newValue!;
                        });
                      }),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Container(
            height: height * 0.07,
            width: width * 0.22,
            color: Colors.red.withOpacity(0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
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
          markDetil(width, font, height, 'Fasalul Haque', '100'),
          markDetil(width, font, height, 'Anas', '49'),
          markDetil(width, font, height, 'Swalih', '99'),
          markDetil(width, font, height, 'Raseel', '77'),
          markDetil(width, font, height, 'Savad', '99'),
          markDetil(width, font, height, 'Sahad', '99'),
        ],
      ),
    );
  }

  Column markDetil(
      double width, TextStyle text, double height, String name, String mark) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.03),
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
                    child: Text(
                      mark,
                      style: text,
                    ))),
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
}
