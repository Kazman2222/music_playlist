import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kBackGroundColour = Color.fromARGB(255, 32, 32, 32);

const kHintDisplayTextStyle = TextStyle(fontSize: 16.0, color: Colors.white);

const kTextFieldDecoration = InputDecoration(
  hintText: 'A value',
  hintStyle: kHintDisplayTextStyle,
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: Colors.green, width: 3.0, style: BorderStyle.solid),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
);

//
// decoration: BoxDecoration(
// image: DecorationImage(
// image: const AssetImage('images/location_background.jpg'),
// fit: BoxFit.cover,
// colorFilter: ColorFilter.mode(
// Colors.white.withOpacity(0.8), BlendMode.dstATop),
// ),
// ),
