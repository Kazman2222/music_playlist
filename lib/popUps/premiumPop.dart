import 'dart:ui';

import 'package:audio_playlist/popUps/audiencefeeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumSub extends StatelessWidget {
  const PremiumSub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/pics/popup_background.png',
              ),
              fit: BoxFit.cover),
        ),
        width: double.infinity,
        child: ClipRRect(
          // make sure we apply clip it properly
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Special Offer!',
                      style: GoogleFonts.lato(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/pics/gold_package-removebg-preview.png',
                        height: 250.h,
                        width: 500.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          premiumDetail(
                              iconData: Icons.local_fire_department,
                              iconInfo: 'Free Promo every week'),
                          SizedBox(
                            height: 10.h,
                          ),
                          premiumDetail(
                              iconData: Icons.edit,
                              iconInfo: 'Premium Sound Effects'),
                          SizedBox(
                            height: 10.h,
                          ),
                          premiumDetail(
                              iconData: Icons.music_note,
                              iconInfo: 'User-Own & Premium Beats'),
                          SizedBox(
                            height: 10.h,
                          ),
                          premiumDetail(
                              iconData: Icons.mic,
                              iconInfo: '2x Recording Time'),
                          SizedBox(
                            height: 10.h,
                          ),
                          premiumDetail(
                              iconData: Icons.thumb_up,
                              iconInfo: 'Premium Votes Worth Double'),
                          SizedBox(
                            height: 10.h,
                          ),
                          premiumDetail(
                              iconData: Icons.cloud_upload_sharp,
                              iconInfo: 'Export to Cloud'),
                          SizedBox(
                            height: 10.h,
                          ),
                          premiumDetail(
                              iconData: Icons.query_stats,
                              iconInfo: 'Advanced Statistics')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '50%',
                                style: GoogleFonts.lato(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                              Text(
                                'OFF',
                                style: GoogleFonts.lato(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            "ON PREMIUM",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: <Color>[
                                    Colors.white,
                                    Color(0xffffd700)
                                    //add more color here.
                                  ],
                                ).createShader(
                                  const Rect.fromLTWH(50.0, 200.0, 200.0, 80.0),
                                ),
                            ),
                          ),
                        ],
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
                              borderRadius: BorderRadius.circular(50)),
                          primary: const Color(0xffffd700),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Redeem Offer',
                          style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row premiumDetail({required IconData iconData, required String iconInfo}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 30.sp,
          color: const Color(0xffffd700),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          iconInfo,
          style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              color: Colors.white),
        ),
      ],
    );
  }
}
