import 'package:audio_playlist/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/buttons.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColour,
      appBar:
          buildAppBars(text: 'Profile', onTap: () => Navigator.pop(context)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Image.asset(
              "assets/pics/profileAvatar.png",
              height: 200.h,
              width: 200.w,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Text(
              "James Bond",
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: SizedBox(
              height: 60.h,
              width: 180.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: Colors.green),
                onPressed: (() {}),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "35",
                            style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 100.w,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "500",
                            style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            child: Column(
              children: [
                buildPadding(),
                InkButton(
                  icon1: Icons.playlist_add,
                  text1: 'Playlist',
                  onTap: () {
                    null;
                  },
                  icon2: Icons.arrow_forward_ios,
                ),
                buildPadding(),
                InkButton(
                  icon1: Icons.favorite_outline_sharp,
                  text1: 'Likes',
                  onTap: () {
                    null;
                  },
                  icon2: Icons.arrow_forward_ios,
                ),
                buildPadding(),
                InkButton(
                  icon1: Icons.download,
                  text1: 'Download',
                  onTap: () {
                    null;
                  },
                  icon2: Icons.arrow_forward_ios,
                ),
                buildPadding(),
                InkButton(
                  icon1: Icons.upload,
                  text1: 'Upload',
                  onTap: () {
                    null;
                  },
                  icon2: Icons.arrow_forward_ios,
                ),
                buildPadding(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
