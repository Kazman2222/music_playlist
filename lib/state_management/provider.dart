import 'package:audio_playlist/state_management/music.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/firebase_api.dart';

class AudioManagement extends ChangeNotifier {
  bool audioDisplaced = true;
  late int post;

  songPosition(int songNum) {
    post = songNum;
    notifyListeners();
  }

  audioStance() {
    audioDisplaced = false;
    notifyListeners();
  }

  audioPopped() {
    audioDisplaced = true;
    notifyListeners();
  }

  List<AudioModel> musixmatch = [];
  List<AudioModel> musixnomatch = [];

  List<AudioModel> _audioList = [];

  List<AudioModel> get audioList => _audioList;

  void fetchAudioFiles(String collectionName) async {
    FirebaseApi firebaseApi = FirebaseApi();
    _audioList = await firebaseApi.fetchAllAudioFiles01(collectionName);
    notifyListeners();
  }
}
