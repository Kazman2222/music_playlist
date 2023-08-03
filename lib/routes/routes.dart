import 'package:audio_playlist/adminPanel/add_podcast.dart';
import 'package:audio_playlist/artistesdetails/artiste_profile.dart';
import 'package:audio_playlist/artistesdetails/profile.dart';
import 'package:audio_playlist/audiio_player.dart';
import 'package:audio_playlist/audio/player.dart';
import 'package:audio_playlist/authentication/auth-one.dart';
import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:audio_playlist/home/categories.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:audio_playlist/home/playlist.dart';
import 'package:audio_playlist/home/radio.dart';
import 'package:audio_playlist/login/forgetpassword.dart';
import 'package:audio_playlist/login/login.dart';
import 'package:audio_playlist/login/signUp.dart';
import 'package:audio_playlist/onboarding/onboard_1.dart';
import 'package:audio_playlist/onboarding/onboard_2.dart';
import 'package:audio_playlist/popUps/premiumPop.dart';
import 'package:audio_playlist/profile/profile.dart';
import 'package:audio_playlist/profile/profile_information.dart';
import 'package:audio_playlist/profile/register.dart';
import 'package:flutter/material.dart';

import '../onboarding/onboard_3.dart';

class routeManager {
  static const String homePages = '/';
  static const String signUp = '/signup';
  static const String loginUp = '/loginup';
  static const String premiumPopUp = '/premiumPop';
  static const String artisteProfile = '/artistProfile';
  static const String authOne = '/authOne';
  static const String forgetPasswords = '/forgetPassword';
  static const String profilePages = '/profilePage';
  static const String onboarding1 = '/onboard1';
  static const String onboarding2 = '/onboard2';
  static const String onboarding3 = '/onboard3';
  static const String addPodcast = '/addPodcast';
  static const String editProfile = '/editProfile';
  static const String registerUser = '/register';
  static const String play = '/playlist';
  static const String playing = '/currentPlay';
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
      case onboarding1:
        return MaterialPageRoute(builder: ((context) => const Onboarding()));
      case onboarding2:
        return MaterialPageRoute(builder: ((context) => const Onboarding2()));
      case onboarding3:
        return MaterialPageRoute(builder: ((context) => const Onboarding3()));
      case addPodcast:
        return MaterialPageRoute(builder: ((context) => const AddPodcast()));
      case editProfile:
        return MaterialPageRoute(
            builder: ((context) => const ProfileDetails()));
      case registerUser:
        return MaterialPageRoute(builder: ((context) => const register()));
      case play:
        return MaterialPageRoute(builder: ((context) => const playlist()));
      case playing:
        return MaterialPageRoute(builder: ((context) => const currentPlay()));
      default:
        throw const FormatException('no route found');
    }
  }
}
