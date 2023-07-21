import 'package:audio_playlist/artistesdetails/artiste_info.dart';
import 'package:audio_playlist/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class ArtistProfile extends StatefulWidget {
  const ArtistProfile({Key? key}) : super(key: key);

  @override
  State<ArtistProfile> createState() => _ArtistProfileState();
}

ArtisteInfo musician = ArtisteInfo();

class _ArtistProfileState extends State<ArtistProfile> {
  final int _artisteNo = musician.artistPicker();
  final List _muisicianInfo = musician.artisteInfo;
  @override
  Widget build(BuildContext context) {
    var detail = _muisicianInfo[_artisteNo];
    return Scaffold(
      backgroundColor: kBackGroundColour,
      appBar: buildAppBarsVerified(
        text: detail.artistName,
        onTap: () => Navigator.pop(context),
        verification: detail.artistVerified,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: NetworkImage(
                        detail.artistImage,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                detail.artistRealName,
                style: GoogleFonts.raleway(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'a.k.a',
                        style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '${detail.artistName}',
                        style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(
                    // height: 50.h,
                    // width: 150.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          side: const BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: (() {}),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            // size: 16.sp,
                            color: Colors.white,
                          ),
                          Text(
                            'Follow',
                            style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Latest',
                style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Popular',
                style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.artistCount,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                      Text(
                        'Monthly Listeners',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.green),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        detail.artistFollowers,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                      Text(
                        'Followers',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.green),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Info',
                style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
              const Divider(
                thickness: 1,
                // height: 3,
                color: Colors.white,
              ),
              Text(
                detail.artistAbout,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                detail.artistAbout2,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.5),
              ),
              // const Divider(
              //   thickness: 1,
              //   // height: 3,
              //   color: Colors.white,
              // ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Socials',
                    style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  socialMedia(
                      pic: 'assets/pics/instagram.png',
                      handle: detail.instagramHandle),
                  SizedBox(
                    height: 20.h,
                  ),
                  // socialMedia(
                  //     pic: 'assets/pics/snapchat.png',
                  //     handle: detail.snapHandle),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // socialMedia(
                  //     pic: 'assets/pics/twitter.png',
                  //     handle: detail.twitterHandle),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // socialMedia(
                  //     pic: 'assets/pics/youtube.png',
                  //     handle: detail.youtubeHandle),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // _launchURLApp(handle)

  socialMedia({required String pic, String? handle}) {
    return GestureDetector(
      onTap: handle == null ? null : () => _launchURLApp(handle),
      child: Image.asset(
        pic,
        height: 55,
        width: 55,
      ),
    );
  }
}

_launchURLBrowser() async {
  var url = Uri.parse("https://instagram.com/heisrema?igshid=NTc4MTIwNjQ2YQ==");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLApp(String handle) async {
  var url = Uri.parse(handle);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
