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
      body: Column(
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
                    icon1: Icons.app_registration,
                    text1: 'Dashboard',
                    onTap: () {
                      null;
                    }),
                buildPadding(),
                InkButton(
                    icon1: Icons.account_box,
                    text1: 'Manage Podcast',
                    onTap: () {
                      null;
                    }),
                buildPadding(),
                InkButton(
                    icon1: Icons.add,
                    text1: 'Add New Podcast',
                    onTap: () {
                      null;
                    }),
                buildPadding(),
                InkButton(
                    icon1: Icons.graphic_eq,
                    text1: 'Analytics',
                    onTap: () {
                      null;
                    }),
                buildPadding(),
                InkButton(
                    icon1: Icons.settings,
                    text1: 'Settings',
                    onTap: () {
                      null;
                    }),
                buildPadding(),
                InkButton(
                    icon1: Icons.logout,
                    text1: 'Log-Out',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const logout()),
                      );
                    }),
                buildPadding(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
