import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(
        text,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static showSnackBar01(
      {BuildContext? context, String? text, Duration? duration}) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(
        text,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
      ),
      duration: duration!,
      backgroundColor: Colors.black,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);

    // Use Timer to dismiss SnackBar after the specified duration
    Timer(duration, () {
      ScaffoldMessenger.of(context!).removeCurrentSnackBar();
    });
  }

  static showErrorSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(
        text,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
