import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(text, style: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.green,),
                    ),),
      backgroundColor: Colors.black,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
