import 'package:audio_playlist/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/buttons.dart';

class AddPodcast extends StatefulWidget {
  const AddPodcast({Key? key}) : super(key: key);

  @override
  State<AddPodcast> createState() => _AddPodcastState();
}

class _AddPodcastState extends State<AddPodcast> with TickerProviderStateMixin {
  double size = 100.5;
  int time = 15;
  String timing = 'seconds';
  int percent = 0;
  bool tap = false;

  late AnimationController controls;

  void hitInstance() {
    // late AnimationController controls;
    // TODO: implement initState
    // super.initState();
    setState(() {
      tap = true;
    });

    controls = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
      upperBound: 1,
      // animation doesn't need a Bound!
    );

    controls.forward();

    controls.addListener(() {
      setState(() {});
      print(controls.value);
    });
  }

  void cancelInstance() {
    // late AnimationController controls;
    // TODO: implement initState
    // super.initState();
    setState(() {
      tap = false;
    });
    print('I WAS PRESSED');

    // void dispose() {
    //   controls.dispose();
    //   super.dispose();
    // }
    //
    // dispose();
  }

  @override
  void dispose() {
    controls.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double value = tap ? controls.value : 0.0;
    double per = value * 100;
    int percentage = per.toInt();
    return Scaffold(
      backgroundColor: kBackGroundColour,
      appBar: buildAppBars(
        text: 'Add Podcast',
        onTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add new podcast',
                // textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // CircularProgressIndicator(
              //   value: 0.3,
              //   color: Colors.greenAccent, //<-- SEE HERE
              //   backgroundColor: Colors.grey, //<-- SEE HERE
              // ),
              Center(
                child: DottedBorder(
                  // Color color = Colors.black,
                  // double strokeWidth = 1,
                  // BorderType borderType = BorderType.Rect,
                  // List  dashPattern = const  [3, 1],
                  // EdgeInsets padding = const EdgeInsets.all(2),
                  // EdgeInsets borderPadding = EdgeInsets.zero,
                  // Radius radius = const Radius.circular(0),
                  // StrokeCap strokeCap = StrokeCap.butt,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  strokeWidth: 3,
                  color: Colors.white,
                  strokeCap: StrokeCap.butt,
                  dashPattern: const [6, 6],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      height: 300.h,
                      color: const Color(0xff535353),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      // decoration: BoxDecoration(
                      //   color: const Color(0xff535353),
                      //   borderRadius: BorderRadius.circular(20),
                      //   border: Border.all(
                      //     width: 3.0,
                      //     style: BorderStyle.solid,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      child: Center(
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_upload_outlined,
                                color: Colors.white,
                                size: 40.sp,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Drag & drop or ',
                                  style: GoogleFonts.lato(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'choose file',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    TextSpan(text: ' to upload'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'MP4, AVI or MKV',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xff535353),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                width: double.infinity,
                height: 90.h,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              percentage == 100
                                  ? SizedBox(
                                      height: 55,
                                      width: 55,
                                      child: Image.asset(
                                        'assets/pics/check.png',
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        SizedBox(
                                          height: 55,
                                          width: 55,
                                          child: CircularProgressIndicator(
                                            value: value,
                                            strokeWidth: 6.0,
                                            color: Colors
                                                .greenAccent, //<-- SEE HERE
                                            backgroundColor:
                                                Colors.grey, //<-- SEE HERE
                                          ),
                                        ),
                                        const Positioned(
                                          top: 10,
                                          left: 11,
                                          child: Icon(
                                            Icons.file_copy,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ],
                                    ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Material Matters_MP4',
                                    style: GoogleFonts.lato(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${size}MB   •  $time $timing left',
                                    style: GoogleFonts.lato(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            percentage == 100
                                ? const SizedBox()
                                : Icon(
                                    Icons.close,
                                    size: 30.sp,
                                    color: Colors.green,
                                  ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '$percentage%',
                              style: GoogleFonts.lato(
                                  fontSize: percentage == 100 ? 20.sp : 16.sp,
                                  fontWeight: percentage == 100
                                      ? FontWeight.w900
                                      : FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 120,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.black),
                      onPressed: (() => cancelInstance()),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 120,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.green),
                      onPressed: (() => hitInstance()),
                      child: const Text(
                        'Import',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
