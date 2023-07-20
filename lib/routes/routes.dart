import 'package:audio_playlist/artistesdetails/artiste_profile.dart';
import 'package:audio_playlist/audiio_player.dart';
import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:audio_playlist/home/categories.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:audio_playlist/home/radio.dart';
import 'package:audio_playlist/login/login.dart';
import 'package:audio_playlist/login/signUp.dart';
import 'package:audio_playlist/popUps/premiumPop.dart';
import 'package:flutter/material.dart';

class routeManager {
  static const String homePages = '/';
  static const String signUp = '/signup';
  static const String loginUp = '/loginup';
  static const String premiumPopUp = '/premiumPop';
  static const String artisteProfile = '/artistProfile';
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
      default:
        throw const FormatException('no route found');
    }
  }
}
