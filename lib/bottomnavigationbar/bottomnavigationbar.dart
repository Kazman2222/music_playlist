import 'dart:ui';
import 'package:audio_playlist/artistesdetails/artise_details.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:audio_playlist/home/playlist.dart';
import 'package:audio_playlist/home/radio.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../home/categories.dart';

class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _homePageState();
}

class _homePageState extends State<bottom> {
  final pages = [
    const final_home(),
    const playlist(),
    const categories(),
    const radio()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
              onTap: ((value) {
                setState(() {
                  selectedIndex = value;
                });
              }),
              currentIndex: selectedIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 20,
              iconSize: 29,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: const TextStyle(fontSize: 13),
              selectedLabelStyle: const TextStyle(fontSize: 13),
              selectedIconTheme: IconThemeData(color: Colors.green),
              unselectedIconTheme: IconThemeData(color: Colors.white),
              selectedItemColor: Colors.green,
              backgroundColor: const Color(0xff272727),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.playlist_add), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.radio), label: '')
              ]),
        ),
      ),
    );
  }
}
