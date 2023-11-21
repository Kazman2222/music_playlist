import 'package:flutter/material.dart';

class AllSongs {
  late Map<String, String> songMap;
  List<Map<String, dynamic>> songsList = [];

  // Constructor that takes parameters for the song details
  AlldSongs({
    required String artist,
    required String audio,
    required String album,
    required String title,
    String? coverPhoto,
  }) {
    // Initialize the songMap using the provided parameters
    songMap = {
      'artist': artist,
      'songUrl': audio,
      'albumName': album,
      'songName': title,
      'coverPhoto': coverPhoto == null
          ? 'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='
          : coverPhoto,
    };

    // Assuming songsList is a class property or a variable in scope
    songsList.add(songMap);
  }
}
