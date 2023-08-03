import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file, titles, artiste,
      album, String genre, DateTime releaseDate) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(
          file,
          SettableMetadata(customMetadata: {
            'Song Name': titles.toString(),
            'Artiste': artiste.toString(),
            'Album': album.toString(),
            'Genre': genre,
            'Release Date': releaseDate.toString(),
          }));
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<ListResult> ListFiles() async {
    ListResult results = await storage.ref('songs').listAll();

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
