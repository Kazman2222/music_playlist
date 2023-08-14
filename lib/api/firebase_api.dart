import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class FirebaseApi {
  static UploadTask? uploadFile(
      String destination,
      File file,
      String type,
      String? titles,
      String? artiste,
      String? album,
      String? episode,
      String? describeEpisode,
      String genre,
      DateTime? releaseDate) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      // print(ref);

      if (type == 'PODCAST') {
        return ref.putFile(
          file,
          SettableMetadata(
            customMetadata: {
              'Host': titles.toString(),
              'Titles': artiste.toString(),
              'Description': album.toString(),
              'Episode Title': episode.toString(),
              'Episode Description': describeEpisode.toString(),
              'Genre': genre,
              'Release Date': releaseDate.toString()
            },
          ),
        );
      } else {
        return ref.putFile(
          file,
          SettableMetadata(
            customMetadata: {
              'Song Name': titles.toString(),
              'Artiste': artiste.toString(),
              'Album': album.toString(),
              'Genre': genre,
              'Release Date': releaseDate.toString()
            },
          ),
        );
      }
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<ListResult> ListFiles(String file) async {
    ListResult results = await storage.ref(file).listAll();

    results.items.forEach((Reference ref) {
      print('Found file: $ref');
    });

    return results;
  }

  // Future<String> downloadUrl(String songname) async {
  //   String downloadURL = await storage.ref('audios/$songname').getDownloadURL();
  //
  //   return downloadURL;
  // }
}
