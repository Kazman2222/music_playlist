import 'package:audio_playlist/artistesdetails/artise_details.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:audio_playlist/home/playlist.dart';
import 'package:audio_playlist/home/radio.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _homePageState();
}

class _homePageState extends State<bottom> {
  final pages = [
    const final_home(),
    const playlist(),
    const final_home(),
    const radio(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BottomNavigationBar(
        onTap: ((value) {
          setState(() {
            selectedIndex = value;
            // var page = pages[selectedIndex];
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => page),
            // );
          });
        }),
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 20,
        iconSize: 31,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(fontSize: 13),
        selectedLabelStyle: const TextStyle(fontSize: 13),
        selectedIconTheme: const IconThemeData(color: Colors.green),
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        selectedItemColor: Colors.green,
        backgroundColor: const Color(0xff272727),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add), label: 'Playlist'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'Radio')
        ],
      ),
    );
  }
}
