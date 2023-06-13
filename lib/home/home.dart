import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:school_teacher/drawer/drawer.dart';
import 'package:school_teacher/markEntry/markEntry.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../attendance/attendance.dart';
import '../profileDetails/profileDetails.dart';
import '../timeTable/timeTable.dart';

class Home extends StatefulWidget {
  Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userid;
  Future<String?> getFirmId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = await prefs.getString('user_name').toString();
    print(userid);
    return userid;
  }

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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: const Color.fromARGB(255, 46, 58, 80),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text(
          'Home',
          style: GoogleFonts.abel(color: Colors.white),
        ),
        actions: const [Icon(Icons.more_vert_rounded)],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 46, 58, 80),
            radius: 40,
            child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/image/download.jpg')),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.46, top: height * 0.02),
            child: Text(
              userid.toString(),
              style: GoogleFonts.abel(color: Colors.white, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.85),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileDetails(),
                      ));
                },
                child: Text(
                  'More',
                  style: GoogleFonts.actor(
                      color: Colors.white.withOpacity(0.7), fontSize: 12),
                )),
          ),
          const Divider(
            color: Colors.white,
            height: 5,
            indent: 25,
            endIndent: 25,
          ),
          SizedBox(
            height: height * 0.11,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.03),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Attendance(),
                          ));
                    },
                    child: circle(
                      width,
                      'Mark Attendance',
                      Image.asset(
                        'assets/image/KcxfWyylZBW2_kh8d6eT4-transformed.png',
                        width: width * 0.17,
                        height: height * 0.17,
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TimeTable(),
                        ));
                  },
                  child: circle(
                      width,
                      'Time Table',
                      Image.asset(
                        'assets/image/1836327.png',
                        width: width * 0.12,
                        height: height * 0.12,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TimeTable(),
                          ));
                    },
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MarkEntry(),
                              ));
                        },
                        child: circle(
                            width,
                            'Mark Entry',
                            Image.asset(
                              'assets/image/app-icon-sales-order.png',
                              width: width * 0.19,
                              height: height * 0.15,
                            )))),
                circle(
                    width,
                    'Circular',
                    Image.asset(
                      'assets/image/00000png-transparent-transformed.png',
                      width: width * 0.18,
                      height: height * 0.15,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column details(double width, String text1, String text2) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.08),
              child: Text(
                text1,
                style: GoogleFonts.actor(color: Colors.white, fontSize: 13),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.02),
              child: Text(
                text2,
                style: GoogleFonts.abel(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Divider(
          color: Colors.white.withOpacity(0.5),
          height: 5,
          indent: 25,
          endIndent: 25,
        ),
      ],
    );
  }

  Padding circle(
    double width,
    String text,
    Image image,
  ) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.16),
      child: Column(
        children: [
          Stack(children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 40,
              child: CircleAvatar(
                  radius: 37,
                  backgroundColor: Color.fromARGB(255, 46, 58, 80),
                  child: Center(child: image)
                  //  Icon(
                  //   Icons.calendar_month_outlined,
                  //   size: 50,
                  // ),
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.15),
              child: CircleAvatar(
                radius: 11,
                backgroundColor: Colors.redAccent,
                child: Text(
                  '1',
                  style: GoogleFonts.abel(),
                ),
              ),
            )
          ]),
          SizedBox(
            height: width * 0.02,
          ),
          Text(
            text,
            style: GoogleFonts.abel(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
