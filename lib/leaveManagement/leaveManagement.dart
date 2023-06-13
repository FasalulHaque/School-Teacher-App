import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/drawer.dart';

class LeaveManagement extends StatefulWidget {
  const LeaveManagement({super.key});

  @override
  State<LeaveManagement> createState() => _LeaveManagementState();
}

TabBar get _tabBar => TabBar(
      tabs: [
        Tab(
          child: Text(
            'Pending Leave',
            style: GoogleFonts.akshar(color: Colors.white),
          ),
        ),
        Tab(
          child: Text(
            'Leave History',
            style: GoogleFonts.akshar(color: Colors.white),
          ),
        )
      ],
    );

class _LeaveManagementState extends State<LeaveManagement> {
  String? dropdownValue;
  String? dropdownValue1;
  String? dropdownValue2;
  String? dropdownValue3;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: DrawerScreen(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 46, 58, 80),
            title: Text(
              'Leave Management',
              style: GoogleFonts.abel(color: Colors.white),
            ),
            bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Material(
                  elevation: 0,
                  color: Colors.red,
                  child: _tabBar,
                )),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
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
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                            ),
                            elevation: 0,
                            hint: Text(
                              'Select Class',
                              style: GoogleFonts.abel(
                                  fontSize: 16, color: Colors.black),
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
                                child: Text(
                                  value,
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
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.10),
                          child: DropdownButtonFormField<String>(
                              icon: const Icon(Icons.arrow_drop_down),
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                              ),
                              elevation: 0,
                              hint: Text(
                                'Select Division ',
                                style: GoogleFonts.abel(
                                    fontSize: 16, color: Colors.black),
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
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
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
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                            ),
                            elevation: 0,
                            hint: Text(
                              'Select Class',
                              style: GoogleFonts.abel(
                                  fontSize: 16, color: Colors.black),
                            ),
                            value: dropdownValue2,
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
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                              ),
                              elevation: 0,
                              hint: Text(
                                'Select Division ',
                                style: GoogleFonts.abel(
                                    fontSize: 16, color: Colors.black),
                              ),
                              value: dropdownValue3,
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
                                  dropdownValue3 = newValue!;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
