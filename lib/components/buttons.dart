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
