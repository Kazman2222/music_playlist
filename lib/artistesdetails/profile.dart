import 'package:audio_playlist/constants.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('registraton')
            .where('id', isEqualTo: 'kazeemquayum67@gmail.com')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Container(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          height: 200.h,
                          width: 200.w,
                          child: Image.asset(
                            "assets/pics/premium.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Text(
                          documentSnapshot['firstname'] +
                              ' ' +
                              documentSnapshot['lastname'],
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
                          width: 190,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: Colors.green),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/registerUser'),
                            child: Text(
                              'View Profile',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25.sp),
                            ),
                          ),
                        ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                              icon1: Icons.info_outline,
                              text1: 'About',
                              onTap: () {
                                Navigator.pushNamed(context, '/artistProfile');
                              },
                              icon2: Icons.arrow_forward_ios,
                            ),
                            buildPadding(),
                            InkButton(
                              icon1: Icons.thumb_up_alt_outlined,
                              text1: 'Accolades',
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
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('No Information found'),
            );
          }
        },
      ),
    );
  }
}
