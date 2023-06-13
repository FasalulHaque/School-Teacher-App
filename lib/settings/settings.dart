import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/drawer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var text = GoogleFonts.akshar(fontSize: 16, letterSpacing: 0.5);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const DrawerScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text(
          'Settings',
          style: GoogleFonts.abel(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          settingsDet(
            height,
            width,
            text,
            'Edit Profile',
            const Icon(
              Icons.settings,
              size: 27,
            ),
          ),
          settingsDet(
            height,
            width,
            text,
            'Password',
            const Icon(
              Icons.key_sharp,
              size: 27,
            ),
          ),
          settingsDet(
            height,
            width,
            text,
            'Help',
            const Icon(
              Icons.help,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }

  Padding settingsDet(
      double height, double width, TextStyle text, String setdet, Icon icon) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.03, left: width * 0.07),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 27,
            child: CircleAvatar(radius: 24, child: icon
                //   backgroundImage: AssetImage('assets/image/download.jpg')
                ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: Text(
              setdet,
              style: text,
            ),
          )
        ],
      ),
    );
  }
}
