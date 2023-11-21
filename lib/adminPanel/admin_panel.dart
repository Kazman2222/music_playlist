import 'package:audio_playlist/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/buttons.dart';
import '../login/logout.dart';

class adminPanel extends StatefulWidget {
  const adminPanel({super.key});

  @override
  State<adminPanel> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<adminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColour,
      appBar: buildAppBars(
          text: 'Admin Panel', onTap: () => Navigator.pop(context)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                child: Column(
                  children: [
                    InkButton(
                      icon1: Icons.upload,
                      text1: 'Upload Music',
                      onTap: () {
                        Navigator.pushNamed(context, '/addMusic');
                      },
                    ),
                    buildPadding(),
                    InkButton(
                      icon1: Icons.account_box,
                      text1: 'Manage Data',
                      onTap: () {
                        Navigator.pushNamed(context, '/updateData');
                      },
                    ),
                    buildPadding(),
                    InkButton(
                      icon1: Icons.add,
                      text1: 'Add New Podcast',
                      onTap: () {
                        Navigator.pushNamed(context, '/addPodcast');
                      },
                    ),
                    buildPadding(),
                    InkButton(
                      icon1: Icons.graphic_eq,
                      text1: 'Charts',
                      onTap: () {
                        null;
                      },
                    ),
                    buildPadding(),
                    InkButton(
                      icon1: Icons.settings,
                      text1: 'Settings',
                      onTap: () {
                        Navigator.pushNamed(context, '/updateProfile');
                      },
                    ),
                    buildPadding(),
                    InkButton(
                      icon1: Icons.logout,
                      text1: 'Log-Out',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const logout()),
                        );
                      },
                    ),
                    buildPadding(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
