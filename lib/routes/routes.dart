import 'package:audio_playlist/artistesdetails/podcast_details.dart';
import 'package:flutter/material.dart';

import '../adminPanel/admin_panel.dart';
// import '../bottomnavigationbar/bottomnavigationbar.dart';
import '../home/final_home.dart';
import '../home/playlist.dart';
import '../home/radio.dart';
import '../login/login.dart';
import '../login/logout.dart';
import '../artistesdetails/profile.dart';

class routeManager {
  static const String homePages = '/'; //*cleared
  static const String loginPages = '/login';
  static const String logoutPages = '/logout';
  static const String radioPages = '/radio'; //*cleared
  static const String adminpanelPages = '/admin';
  static const String playlistPages = '/playlist'; //*cleared
  static const String profilePages = '/profile';
  static const String profilepodcastPages = '/podcast_details';

  static Route<dynamic> routeSettings(RouteSettings settings) {
    switch (settings.name) {
      case homePages:
        return MaterialPageRoute(builder: ((context) => const final_home()));

      case loginPages:
        return MaterialPageRoute(builder: ((context) => const Login()));

      case logoutPages:
        return MaterialPageRoute(builder: ((context) => const logout()));

      case adminpanelPages:
        return MaterialPageRoute(builder: ((context) => const adminPanel()));

      case radioPages:
        return MaterialPageRoute(builder: ((context) => const radio()));

      case playlistPages:
        return MaterialPageRoute(builder: ((context) => const playlist()));

      case profilePages:
        return MaterialPageRoute(builder: ((context) => const profilePage()));

      case profilepodcastPages:
        return MaterialPageRoute(builder: ((context) => const Podcast()));

      default:
        throw const FormatException('no route found');
    }
  }
}
