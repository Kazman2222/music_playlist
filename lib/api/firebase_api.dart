import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/editable_text.dart';

import '../state_management/music.dart';

class FirebaseApi {
  static UploadTask? uploadFile(
      String destination,
      File file,
      String type,
      String? id,
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
              'Release Date': releaseDate.toString(),
              'id': id.toString(),
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
              'Release Date': releaseDate.toString(),
              'id': id.toString(),
            },
          ),
        );
      }
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  static UploadTask? uploadPicFile(String destination, File file, String type) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      // print(ref);

      if (type == 'PODCAST') {
        return ref.putFile(
          file,
        );
      } else {
        return ref.putFile(
          file,
        );
      }
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  static UploadTask? uploadProfilePic(
      String destination, File file, String id) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      // print(ref);

      return ref.putFile(
        file,
        SettableMetadata(
          customMetadata: {'id': id.toString()},
        ),
      );
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  // static Future<UploadTask?> uploadFile(
  //   String destination,
  //   File file,
  //   String type,
  //   String? titles,
  //   String? artiste,
  //   String? album,
  //   String? episode,
  //   String? describeEpisode,
  //   String genre,
  //   DateTime releaseDate,
  // ) async {
  //   try {
  //     final ref = FirebaseStorage.instance.ref(destination);
  //
  //     // Upload the file
  //     final UploadTask uploadTask = ref.putFile(file);
  //
  //     // Get the upload task snapshot to wait for it to complete
  //     final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
  //
  //     // Fetch the download URL
  //     final String downloadURL = await snapshot.ref.getDownloadURL();
  //
  //     // Define custom metadata
  //     final Map<String, String> customMetadata = {
  //       if (type == 'PODCAST') ...{
  //         'Host': titles.toString(),
  //         'Titles': artiste.toString(),
  //         'Description': album.toString(),
  //         'Episode Title': episode.toString(),
  //         'Episode Description': describeEpisode.toString(),
  //         'Genre': genre,
  //         'Release Date': releaseDate.toString(),
  //       } else ...{
  //         'Song Name': titles.toString(),
  //         'Artiste': artiste.toString(),
  //         'Album': album.toString(),
  //         'Genre': genre,
  //         'Release Date': releaseDate.toString(),
  //       },
  //       'Audio File': downloadURL,
  //     };
  //
  //     // Set the custom metadata for the file
  //     await snapshot.ref
  //         .updateMetadata(SettableMetadata(customMetadata: customMetadata));
  //
  //     return uploadTask;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<ListResult> ListFiles(String file) async {
    ListResult results = await storage.ref(file).listAll();

    results.items.forEach((Reference ref) {
      String path = ref.fullPath;
      print('Found file: $path');
    });

    return results;
  }

  // Future<Map<String, String>?> AllFiles(String file) async {
  //   // FullMetadata metadata =
  //   //     await storage.ref(file).child('Joeboy_-_Baby_.mp3').getMetadata();
  //
  //   ListResult results = await storage.ref(file).listAll();
  //
  //   List<String> audio = [];
  //
  //   results.items.forEach((Reference ref) async {
  //     String path = ref.fullPath;
  //     audio.add(path);
  //   });
  //
  //   for (String music in audio) {
  //     print('Audio Found: $music');
  //
  //     FullMetadata metadata = await storage.ref().child(music).getMetadata();
  //     return metadata.customMetadata;
  //   }
  //   return null;
  //   // for (song in )
  //
  //   // FullMetadata metadata = await storage.ref().child(audio[0]).getMetadata();
  //   // results.items.forEach((Reference ref) {
  //   //   print('Found file: $ref');
  //   // });
  //
  //   // return metadata.customMetadata;
  // }

  Future<List<Map<String, String>>> fetchAllAudioFiles(String directory) async {
    try {
      ListResult results = await storage.ref(directory).listAll();
      List<Map<String, String>> audioMetadataList = [];

      for (Reference ref in results.items) {
        FullMetadata metadata = await ref.getMetadata();
        Map<String, String>? customMetadata = metadata.customMetadata;

        if (customMetadata != null && customMetadata.isNotEmpty) {
          audioMetadataList.add(customMetadata);
        }
      }

      return audioMetadataList;
    } catch (error) {
      print("An error occurred while fetching audio files: $error");
      return [];
    }
  }

  Future<List<AudioModel>> fetchAllAudioFiles01(String directory) async {
    try {
      ListResult results = await storage.ref(directory).listAll();
      List<Map<String, String>> audioMetadataList = [];

      for (Reference ref in results.items) {
        FullMetadata metadata = await ref.getMetadata();
        Map<String, String>? customMetadata = metadata.customMetadata;

        if (customMetadata != null && customMetadata.isNotEmpty) {
          audioMetadataList.add(customMetadata);
        }
      }

      List<AudioModel> audioList = [];

      for (Map<String, String> document in audioMetadataList) {
        String? title = document['Song Name'];
        String? artist = document['Artiste'];
        String? album = document['Album'];
        String? genre = document['Genre'];
        String? release = document['Release Date'];
        String? audio = document['Audio File'];
        String? coverPhoto = document['Cover Photo'] ??
            'https://media.istockphoto.com/id/1391397901/photo/contemporary-art-collage-stylish-silhouette-of-man-male-casual-fashion-isolated-over-abstract.jpg?s=612x612&w=0&k=20&c=qpP01m5xctaam9bWFYd58SrGw-lOmmZMiChN2ENo-DU=';
        String? id = document['id'];

        AudioModel audioModel = AudioModel(
          title: title ?? 'Default Title',
          artist: artist ?? 'Default Artist',
          album: album ?? 'Default Album',
          genre: genre ?? 'Default Genre',
          release: release ?? 'Default Release Date',
          audio: audio ?? 'Default Audio File',
          coverPhoto: coverPhoto,
          id: id ?? 'Default ID',
        );

        audioList.add(audioModel);
      }

      print(audioList);
      return audioList;
    } catch (error) {
      print("An error occurred while fetching audio files: $error");
      return [];
    }
  }

// Future MainFiles(file) async {
  //   // Create a StorageReference object for the audio file.
  //   final audioRef = FirebaseStorage.instance.ref().child('my_audio.mp3');
  //
  //   // Get the metadata for the audio file.
  //   final metadata = await audioRef.getMetadata();
  //
  //   // Print the file name.
  //   print(metadata.name);
  // }

  // Future<String> downloadUrl(String songname) async {
  //   String downloadURL = await storage.ref('audios/$songname').getDownloadURL();
  //
  //   return downloadURL;
  // }

}
