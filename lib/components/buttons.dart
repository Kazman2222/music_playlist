library showbutton;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

export 'buttons.dart';

Padding buildPadding() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Divider(
      color: Colors.white,
      height: 2.h,
      thickness: 1,
    ),
  );
}

Padding builderPadding() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Divider(
      color: Colors.white,
      height: 2.h,
      thickness: 1,
    ),
  );
}

class InkButton extends StatelessWidget {
  // const InkButton({
  //   Key? key,
  // }) : super(key: key);

  InkButton({
    required this.icon1,
    this.icon2,
    required this.text1,
    required this.onTap,
  });

  final VoidCallback onTap;
  final IconData icon1;
  final String text1;
  final IconData? icon2;

  @override
  Widget build(BuildContext context) {
    // bool switcher = switchVal;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon1,
              color: Colors.green,
              size: 33.sp,
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Text(
                text1,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25.sp),
              ),
            ),
            Icon(
              icon2,
              color: Colors.green,
              size: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBars({required String text, required VoidCallback onTap}) {
  return AppBar(
    backgroundColor: kBackGroundColour,
    centerTitle: true,
    leading: GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    ),
    title: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

AppBar buildAppBarsVerified(
    {required String text,
    required VoidCallback onTap,
    required bool verification}) {
  verified(bool verify) {
    if (verify == true) {
      return Row(
        children: const [
          SizedBox(
            width: 3,
          ),
          Icon(
            Icons.verified,
            size: 15,
            color: Colors.greenAccent,
          )
        ],
      );
    } else {
      return const SizedBox(
        width: 3,
      );
    }
  }

  return AppBar(
    backgroundColor: kBackGroundColour,
    centerTitle: true,
    leading: GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    ),
    titleSpacing: 0,
    title: Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        verified(verification)
      ],
    ),
  );
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kBackGroundColour,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: const Center(
          child: Icon(
            Icons.dangerous,
            size: 60,
            color: Colors.red,
          ),
        ),
        content: const Text(
          'Password isn\'t a match!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 22),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: const Color.fromARGB(255, 57, 213, 63),
                    padding: EdgeInsets.all(15)),
                onPressed: () {
                  // Perform an action when the user presses the button
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  'RETURN',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

List<String> header = [
  'Unleash the Rhythm Discover Your Music Journey.',
  'Tune in to Endless Entertainment Radio, Podcasts & More.',
  'Streaming Bliss Enjoy Your Favorite Content Anytime, Anywhere.',
];

List<String> onboardImages = [
  "assets/pics/onboard_1.png",
  "assets/pics/onboard_2.png",
  "assets/pics/onboard_3.png"
];
