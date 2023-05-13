import 'dart:ui';
import 'package:audio_playlist/artistesdetails/artise_details.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:audio_playlist/home/radio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final pages = [const final_home(), const final_home(), final_home(), const radio()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: ((value) {
            setState(() {
              selectedIndex = value;
             
            });
          }),
          currentIndex: selectedIndex,
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: GoogleFonts.acme(fontSize: 13),
          selectedLabelStyle: GoogleFonts.acme(fontSize: 13),
          selectedIconTheme: IconThemeData(color: Colors.black),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          selectedItemColor: Colors.black,
          backgroundColor: Color.fromARGB(255, 236, 225, 220),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.record_voice_over), label: 'Podcast'),
            BottomNavigationBarItem(
                icon: Icon(Icons.music_note), label: 'Artistes'),
            BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'Radio')
          ]),
    );
  }
}
