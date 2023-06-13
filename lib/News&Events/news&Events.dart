import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/drawer.dart';

class NewsEvents extends StatefulWidget {
  const NewsEvents({super.key});

  @override
  State<NewsEvents> createState() => _NewsEventsState();
}

class _NewsEventsState extends State<NewsEvents> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text(
          'News & Events',
          style: GoogleFonts.abel(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            height: height * 0.05,
            width: width * 1,
            child: Padding(
              padding: EdgeInsets.only(
                left: width * 0.06,
                right: width * 0.06,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const MarkAttendance(),
                  //     ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent.withOpacity(0.9),
                ),
                child: Text(
                  'Todays Updates !',
                  style: GoogleFonts.actor(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
