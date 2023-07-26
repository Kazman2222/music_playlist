import 'package:audio_playlist/artistesdetails/artiste_profile.dart';
import 'package:audio_playlist/artistesdetails/profile.dart';
import 'package:audio_playlist/audiio_player.dart';
import 'package:audio_playlist/authentication/auth-one.dart';
import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:audio_playlist/home/categories.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:audio_playlist/home/radio.dart';
import 'package:audio_playlist/login/forgetpassword.dart';
import 'package:audio_playlist/login/login.dart';
import 'package:audio_playlist/login/signUp.dart';
import 'package:audio_playlist/popUps/premiumPop.dart';
import 'package:audio_playlist/profile/profile.dart';
import 'package:audio_playlist/profile/profile_information.dart';
import 'package:flutter/material.dart';

class routeManager {
  static const String homePages = '/';
  static const String signUp = '/signup';
  static const String loginUp = '/loginup';
  static const String premiumPopUp = '/premiumPop';
  static const String artisteProfile = '/artistProfile';
  static const String authOne = '/authOne';
  static const String forgetPasswords = '/forgetPassword';
  static const String profilePages = '/profilePage';
  // PremiumSub
  static Route<dynamic> routeSettings(RouteSettings settings) {
    switch (settings.name) {
      case homePages:
        return MaterialPageRoute(builder: ((context) => const bottom()));
      case signUp:
        return MaterialPageRoute(builder: ((context) => const Signup()));
      case loginUp:
        return MaterialPageRoute(builder: ((context) => const Login()));
      case premiumPopUp:
        return MaterialPageRoute(builder: ((context) => const PremiumSub()));
      case artisteProfile:
        return MaterialPageRoute(builder: ((context) => const ArtistProfile()));
      case authOne:
        return MaterialPageRoute(builder: ((context) => const authone()));
      case forgetPasswords:
        return MaterialPageRoute(
            builder: ((context) => const forgetPassword()));
      case profilePages:
        return MaterialPageRoute(builder: ((context) => const audio_player()));
      default:
        throw const FormatException('no route found');
    }
  }
}
