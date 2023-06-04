import 'package:audio_playlist/audiio_player.dart';
import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

class routeManager {
  static const String homePages = '/';
  static Route<dynamic> routeSettings(RouteSettings settings) {
    switch (settings.name) {
      case homePages:
        return MaterialPageRoute(builder: ((context) => const audio_player() ));
        default:
         throw const FormatException('no route found');
    }
  }
}
