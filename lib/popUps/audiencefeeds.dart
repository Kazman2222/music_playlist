import 'dart:ui';

import 'package:audio_playlist/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Future feedsBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.58,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://wallpaperaccess.com/full/5054293.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                // make sure we apply clip it properly
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 340.h,
                  child: Column(
                    children: [
                      premiumDetail(
                          iconData: Icons.local_fire_department,
                          iconInfo: 'Get to the front of the Audience feed'),
                      premiumDetail(
                          iconData: Icons.remove_red_eye,
                          iconInfo: '1000+ fans will see your track'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff232323),
                          border: Border.all(
                              color: Colors.lightGreenAccent,
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Classic Promo',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '- 3+ Judges will see your track',
                                    style: GoogleFonts.lato(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                '\$500',
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff232323),
                          // border: Border.all(
                          //     color: Colors.lightGreenAccent,
                          //     width: 1.0,
                          //     style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Free Promo every week',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '- Get free Send to Audience',
                                    style: GoogleFonts.lato(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '- Unlimited Judge 4 Judge',
                                    style: GoogleFonts.lato(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '- ALL the Premium perks',
                                    style: GoogleFonts.lato(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Free',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'with Premium',
                                    style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: const Color(0xff86EE60),
                          ),
                          onPressed: (() {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const final_home()),
                            // );
                          }),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                size: 40.sp,
                                color: Colors.black,
                              ),
                              Text(
                                'Send to Audience!',
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -70.h,
              left: 100.w,
              right: 100.w,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff5C8D89),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                height: 230,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/pics/profileAvatar.png',
                            height: 40.h,
                            width: 40.w,
                          ),
                          Text(
                            'Drake',
                            style: GoogleFonts.lato(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                          ),
                          Icon(
                            Icons.local_fire_department,
                            size: 40.sp,
                            color: const Color(0xff86EE60),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: Image.network(
                          'https://img.buzzfeed.com/buzzfeed-static/complex/images/rrgyzeu7ucbf5styxkuw/drake-21-savage-her-loss-album-cver.jpg?downsize=920:*&output-format=auto&output-quality=auto',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.close,
                size: 30.sp,
                color: Colors.green,
              ),
            ),
          ],
        ),
      );
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    backgroundColor: Colors.grey,
  );
}

Row premiumDetail({required IconData iconData, required String iconInfo}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        iconData,
        size: 30.sp,
        color: const Color(0xff86EE60),
      ),
      SizedBox(
        width: 5.w,
      ),
      Text(
        iconInfo,
        style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            color: const Color(0xffF4F7ED)),
      ),
    ],
  );
}
