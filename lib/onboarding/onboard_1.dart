import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audio_playlist/constants.dart';
import 'package:audio_playlist/onboarding/onboard_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../components/buttons.dart';
import '../components/changer.dart';
import '../login/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late AnimationController controls;
  late Animation<Offset> animation;

  late int index;
  @override
  void initState() {
    index = 0;
    super.initState();

    controls = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
      // upperBound: 1,
      // animation doesn't need a Bound!
    )..forward();

    animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: controls,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controls.dispose();
    super.dispose();
    // This kills the animation is the screen isn't active.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColour,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              // SlideTransition(
              //   position: animation,
              //   child: Image.asset(
              //     'assets/pics/UG_Radio.png',
              //     width: double.infinity,
              //     height: 300.h,
              //   ),
              // ),
              SlideTransition(
                position: animation,
                child: Image.asset(
                  'assets/pics/UG_Radio.png',
                  width: double.infinity,
                  height: 300.h,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                flex: 2,
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      header[index],
                      textStyle: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          height: 1.4),
                      speed: const Duration(milliseconds: 60),
                      curve: Curves.linear,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: 195.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      // color: Colors.lightGreenAccent,
                      color: const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                      // border: Border.all(
                      //   width: 0.0, // Border width
                      //   style: BorderStyle.solid, // Set the border style to solid
                      // ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 65.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: index == 0
                                ? Colors.lightGreenAccent
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          width: 65.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: index == 1
                                ? Colors.lightGreenAccent
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          width: 65.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: index == 2
                                ? Colors.lightGreenAccent
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Colors.green),
                    onPressed: (() {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 200),
                          child: const Onboarding2(),
                        ),
                      );
                    }),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
