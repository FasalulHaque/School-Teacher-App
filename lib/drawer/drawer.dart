import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_teacher/attendance/attendance.dart';
import 'package:school_teacher/login/login.dart';
import 'package:school_teacher/markEntry/markEntry.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../News&Events/news&Events.dart';
import '../home/home.dart';
import '../leaveManagement/leaveManagement.dart';
import '../markReport/markReport.dart';
import '../profileDetails/profileDetails.dart';
import '../services api/teacherDetailsApi/fetch.dart';
import '../services api/teacherDetailsApi/teachDmodel.dart';
import '../settings/settings.dart';
import '../timeTable/timeTable.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String? userid;
  Future<String?> getFirmId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = await prefs.getString('user_name').toString();
    print(userid);
    return userid;
  }

  String? useridremove;
  Future<String?> getFirmromveid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? useridremove = await prefs.remove('user_id').toString();

    return useridremove;
  }

  bool _isShown = true;
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
    return Drawer(
        child: Container(
      color: const Color.fromARGB(255, 86, 124, 195),
      child: ListView(
        children: [
          // FutureBuilder<ProfileData>(
          //     future: fetchdata(userid.toString()),
          //     builder:
          //         (BuildContext context, AsyncSnapshot<ProfileData> snapshot) {
          //       if (snapshot.hasData) {
          //         final data = snapshot.data!.profileData;
          //         return Expanded(
          //             child: ListView.builder(
          //                 itemCount: data.length,
          //                 itemBuilder: (BuildContext context, int index) {}));
          //       }
          //       return Center(
          //         child: null,
          //       );
          //     }),
          Padding(
            padding: EdgeInsets.only(top: height * 0.08, right: width * 0.42),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 37,
              child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/image/download.jpg')),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.16, top: height * 0.02),
            child: Text(
              userid.toString(),
              style: GoogleFonts.abel(color: Colors.white, fontSize: 17),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Container(
            height: height * 0.75,
            width: width * 0.33,
            color: const Color.fromARGB(255, 46, 58, 80),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'Home ',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.mark_chat_read_outlined,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'Attendance ',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Attendance(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.menu_book_outlined,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'Time Table ',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimeTable(),
                        ));
                  },
                ),
                // ListTile(
                //   leading: const Icon(
                //     Icons.menu_book_outlined,
                //     color: Colors.white,
                //     size: 23,
                //   ),
                //   title: Text(
                //     'Exam Result ',
                //     style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                //   ),
                //   onTap: () {},
                // ),
                ListTile(
                  leading: const Icon(
                    Icons.twenty_mp_sharp,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'Mark Entry ',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MarkEntry(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.report_gmailerrorred_outlined,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'Mark Report ',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MarkReport(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.manage_accounts_outlined,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'Leave Management',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LeaveManagement(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.newspaper_outlined,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'News & Events',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewsEvents(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.window_sharp,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'Circular ',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'Settings ',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Settings(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                    size: 23,
                  ),
                  title: Text(
                    'Logout ',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: Text(
                              'Delete',
                              style: GoogleFonts.abel(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              'Are you sure ?',
                              style: GoogleFonts.abel(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   _isShown = false;
                                    // });

                                    getFirmromveid();

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                      (route) => false,
                                    );

                                    // _isShown = false;

                                    // deleteTask(
                                    //     snapshot
                                    //         .data![
                                    //             index]
                                    //         .id);
                                  },
                                  child: Text(
                                    'Yes',
                                    style: GoogleFonts.abel(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: GoogleFonts.abel(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          );
                        }).then((value) {
                      setState(() {});
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
