class SongManager {
  List<Map<String, dynamic>> songsList = [];

  void addSong(Map<String, dynamic> songMap) {
    songsList.add(songMap);
  }

  void printSongsList() {
    print('Total Songs in songsList: ${songsList.length}');

    for (int i = 0; i < songsList.length; i++) {
      print('Song $i Details:');
      Map<String, dynamic> songMap = songsList[i];

      // Define a function to print a key-value pair if the value is not null
      void printKeyValue(String key, dynamic value) {
        if (value != null) {
          print('$key: $value');
        }
      }

      // Print each key-value pair for the current songMap
      printKeyValue('Artist', songMap['artist']);
      printKeyValue('Song URL', songMap['songUrl']);
      printKeyValue('Album Name', songMap['albumName']);
      printKeyValue('Song Name', songMap['songName']);
      printKeyValue('Cover Photo', songMap['coverPhoto']);

      print('\n');
    }
  }
}
