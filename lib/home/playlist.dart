import 'dart:ui';

import 'package:audio_playlist/audio/player.dart';
import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:audio_playlist/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../api/firebase_api.dart';
import '../artistesdetails/profile.dart';
import '../audio/current_play.dart';
import '../state_management/music.dart';
import '../state_management/provider.dart';

class playlist extends StatefulWidget {
  const playlist({super.key});

  @override
  State<playlist> createState() => _playlistState();
}

class _playlistState extends State<playlist> {
  final usero = FirebaseAuth.instance.currentUser!;
  // final audioPlayer = AudioPlayer();
  // bool isPlaying = false;
  // bool isRepeat = false;
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;
  // List music = ['olamide.mp3', 'qdot.mp3', 'rock.mp3', 'sample.mp3'];

  // @override
  // void initState() {
  //   super.initState();
  //   setAudio();
  //   audioPlayer.onPlayerStateChanged.listen((event) {
  //     setState(() {
  //       isPlaying = event == PlayerState.playing;
  //     });
  //   });
  //
  //   audioPlayer.onDurationChanged.listen((newDuration) {
  //     setState(() {
  //       duration = newDuration;
  //     });
  //   });
  //
  //   audioPlayer.onPositionChanged.listen((newPosition) {
  //     setState(() {
  //       position = newPosition;
  //     });
  //   });
  //   audioPlayer.onPlayerComplete.listen((event) async {
  //     setState(() {
  //       if (count > music.length) {
  //         count = 0;
  //         setAudio();
  //       } else {
  //         count = count + 1;
  //         setAudio();
  //       }
  //     });
  //
  //     // isPlaying = false;
  //     // await audioPlayer.resume();
  //   });
  // }

  // void newDuration(int second) {
  //   Duration newDurations = Duration(seconds: second);
  //   audioPlayer.seek(newDurations);
  // }

  // int count = 0;

  // List

  // List<Map<String, dynamic>> songsList = [];

  // void addSong({
  //   required String artist,
  //   required String songUrl,
  //   required String albumName,
  //   required String songName,
  //   String? coverPhoto, // Optional parameter with a default value
  // }) {
  //   songsList.add({
  //     'artist': artist,
  //     'songUrl': songUrl,
  //     'albumName': albumName,
  //     'songName': songName,
  //     'coverPhoto': coverPhoto,
  //   });
  // }

  // Future setAudio() async {
  //   final player = AudioCache(prefix: 'lib/audio/');
  //   final url = await player.load(music[count]);
  //   audioPlayer.setSourceUrl(url.path);
  //   //if (isPlaying != false) {
  //   //  audioPlayer.resume();
  //   //  }
  // }

  @override
  void initState() {
    // runNow();
    // TODO: implement initState
    super.initState();
  }

  List musicList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Access the AudioManagement instance using the Provider
    AudioManagement value = context.watch<AudioManagement>();
    AudioManagement value01 = context.read<AudioManagement>();

    // Only fetch audio files if musicList is empty
    if (musicList.isEmpty) {
      value.fetchAudioFiles('songs');
      musicList = value.audioList;
      print(musicList.length);

      for (int i = 0; i < musicList.length; i++) {
        AudioModel audios = value01.audioList[i];
        String ided = audios.id;
        print(i);

        // print(ided);

        if (ided != usero.email) {
          // print(usero.email);
          // print(ided);
          print("executed");
          value.musixnomatch.add(audios);
        } else {
          print("not-executed");
          value.musixmatch.add(audios);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final myModel02 = context.watch<AudioManagement>();
    // final myModel01 = context.read<AudioManagement>();
    //
    // // Fetch audio files when the widget is built
    // myModel02.fetchAudioFiles('songs');

    // AudioManagement value = context.watch<AudioManagement>();

    return Consumer<AudioManagement>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: kBackGroundColour,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const profilePage()),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 71, 224, 76),
                              radius: 20.r,
                              child: Text(usero.email![0].toUpperCase(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black)),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('UG Radio',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ],
                      ),
                      // Row(
                      //   children: const [
                      //     Icon(
                      //       Icons.search,
                      //       size: 29,
                      //       color: Colors.white,
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Icon(
                      //       Icons.add,
                      //       size: 29,
                      //       color: Colors.white,
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Text(
                    'My Tracks',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  height: 230,
                  width: double.infinity,
                  child: musicList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.lightGreenAccent,
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.musixmatch.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            // final metadata = audioMetadataList[index];
                            // Map<String, String> audios = value.audioList[index] as Map<String, String>;
                            AudioModel audios = value.musixmatch[index];

                            final title = audios.title;
                            final artist = audios.artist;
                            final album = audios.album;
                            final genre = audios.genre;
                            final release = audios.release;
                            final audio = audios.audio;
                            final coverPhoto = audios.coverPhoto;
                            final id = audios.id;

                            final musicLists = value.musixmatch;

                            dynamic someVal;

                            // final title = audios['Song Name'];
                            // final artist = audios['Artiste'];
                            // final album = audios['Album'];
                            // final genre = audios['Genre'];
                            // final release = audios['Release Date'];
                            // final audio = audios['Audio File'];
                            // final coverPhoto = audios['Cover Photo'];
                            // final id = audios['id'];

                            if (value.musixmatch.isEmpty) {
                              someVal = Center(
                                  child: CircularProgressIndicator(
                                color: Colors.lightGreenAccent,
                              ));
                            } else {
                              someVal = Container(
                                width: 150,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(coverPhoto),
                                        fit: BoxFit.cover)),
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 140, 140, 140)
                                          .withOpacity(0.9),
                                  radius: 25,
                                  child: GestureDetector(
                                    onTap: () => {
                                      // setState(() {
                                      //   count = index;
                                      //   setAudio();
                                      //   isPlaying = false;
                                      //   print(count);
                                      // }),
                                      // player(
                                      //     count, isPlaying, duration, position)

                                      // Navigator.push(
                                      //   context,
                                      //   PageTransition(
                                      //     type: PageTransitionType.bottomToTop,
                                      //     duration:
                                      //         const Duration(milliseconds: 300),
                                      //     child: const currentPlay(),
                                      //   ),
                                      // )

                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: currentPlay(
                                            index: index,
                                            musicList: musicLists,
                                          ),
                                        ),
                                      )
                                    },
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Color.fromARGB(255, 219, 217, 217),
                                      size: 29,
                                    ),
                                  ),
                                ),
                              );
                            }

                            return someVal;
                          })),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Text(
                    'New Music Feed',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  height: 230,
                  width: double.infinity,
                  child: musicList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.lightGreenAccent,
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.musixnomatch.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            // final metadata = audioMetadataList[index];
                            // final title = metadata['Song Name'];
                            // final artist = metadata['Artiste'];
                            // final album = metadata['Album'];
                            // final genre = metadata['Genre'];
                            // final release = metadata['Release Date'];
                            // final audio = metadata['Audio File'];
                            // final coverPhoto = metadata['Cover Photo'];
                            // final id = metadata['id'];

                            AudioModel audios = value.musixnomatch[index];

                            final title = audios.title;
                            final artist = audios.artist;
                            final album = audios.album;
                            final genre = audios.genre;
                            final release = audios.release;
                            final audio = audios.audio;
                            final coverPhoto = audios.coverPhoto;
                            final id = audios.id;

                            final musicLists = value.musixnomatch;

                            return Container(
                              width: 150,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(coverPhoto),
                                      fit: BoxFit.cover)),
                              child: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 140, 140, 140)
                                        .withOpacity(0.9),
                                radius: 25,
                                child: GestureDetector(
                                  onTap: () => {
                                    // setState(() {
                                    //   count = index;
                                    //   setAudio();
                                    //   isPlaying = false;
                                    //   print(count);
                                    // }),
                                    // player(
                                    //     count, isPlaying, duration, position)

                                    // Navigator.push(
                                    //   context,
                                    //   PageTransition(
                                    //     type: PageTransitionType.bottomToTop,
                                    //     duration:
                                    //         const Duration(milliseconds: 300),
                                    //     child: const currentPlay(),
                                    //   ),
                                    // )

                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: currentPlay(
                                          index: index,
                                          musicList: musicLists,
                                        ),
                                      ),
                                    )
                                  },
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Color.fromARGB(255, 219, 217, 217),
                                    size: 29,
                                  ),
                                ),
                              ),
                            );
                          })),
                ),
                // FutureBuilder<List<Map<String, String>>>(
                //     future: FirebaseApi().fetchAllAudioFiles('songs'),
                //     builder: (context, snapshot) {
                //       try {
                //         if (snapshot.connectionState ==
                //             ConnectionState.waiting) {
                //           return Center(
                //               child: CircularProgressIndicator(
                //             color: Colors.lightGreenAccent,
                //           ));
                //         }
                //
                //         if (snapshot.hasError) {
                //           throw snapshot.error!;
                //         }
                //
                //         final audioMetadataList = snapshot.data;
                //
                //         if (audioMetadataList!.isEmpty) {
                //           return Center(child: Text("No audio files found."));
                //         }
                //
                //         return Container(
                //           padding: EdgeInsets.symmetric(horizontal: 8.0),
                //           height: 230,
                //           width: double.infinity,
                //           child: ListView.builder(
                //               itemCount: audioMetadataList.length,
                //               scrollDirection: Axis.horizontal,
                //               shrinkWrap: true,
                //               itemBuilder: ((context, index) {
                //                 final metadata = audioMetadataList[index];
                //                 final title = metadata['Song Name'];
                //                 final artist = metadata['Artiste'];
                //                 final album = metadata['Album'];
                //                 final genre = metadata['Genre'];
                //                 final release = metadata['Release Date'];
                //                 final audio = metadata['Audio File'];
                //                 final coverPhoto = metadata['Cover Photo'];
                //                 final id = metadata['id'];
                //
                //                 if (id == usero.email) {
                //                   return Container();
                //                 } else {
                //                   return Container(
                //                     width: 150,
                //                     margin: const EdgeInsets.symmetric(
                //                         horizontal: 10, vertical: 15),
                //                     alignment: Alignment.center,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(15),
                //                         image: DecorationImage(
                //                             image: NetworkImage(coverPhoto ==
                //                                     null
                //                                 ? 'https://media.istockphoto.com/id/1391397901/photo/contemporary-art-collage-stylish-silhouette-of-man-male-casual-fashion-isolated-over-abstract.jpg?s=612x612&w=0&k=20&c=qpP01m5xctaam9bWFYd58SrGw-lOmmZMiChN2ENo-DU='
                //                                 : coverPhoto),
                //                             fit: BoxFit.cover)),
                //                     child: CircleAvatar(
                //                       backgroundColor: const Color.fromARGB(
                //                               255, 140, 140, 140)
                //                           .withOpacity(0.9),
                //                       radius: 25,
                //                       child: GestureDetector(
                //                         onTap: () => {
                //                           // setState(() {
                //                           //   count = index;
                //                           //   setAudio();
                //                           //   isPlaying = false;
                //                           //   print(count);
                //                           // }),
                //                           // player(
                //                           //     count, isPlaying, duration, position)
                //
                //                           // Navigator.push(
                //                           //   context,
                //                           //   PageTransition(
                //                           //     type: PageTransitionType.bottomToTop,
                //                           //     duration:
                //                           //         const Duration(milliseconds: 300),
                //                           //     child: const currentPlay(),
                //                           //   ),
                //                           // )
                //                         },
                //                         child: const Icon(
                //                           Icons.play_arrow,
                //                           color: Color.fromARGB(
                //                               255, 219, 217, 217),
                //                           size: 29,
                //                         ),
                //                       ),
                //                     ),
                //                   );
                //                 }
                //               })),
                //         );
                //       } catch (error) {
                //         return Center(
                //             child: Container(
                //                 color: Colors.deepOrangeAccent,
                //                 child: Text("An error occurred: $error")));
                //       }
                //     }),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.green),
                      onPressed: (() {
                        // print(songsList);
                        //
                        // print('Length of songsList: ${songsList.length}');
                      }),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Add Playlist',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 10, bottom: 10, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Trending Playlist',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      Text(
                        'view all',
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: double.infinity,
                  child: musicList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.lightGreenAccent,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: value.audioList.length,
                          itemBuilder: ((context, index) {
                            // Map<String, dynamic> metadata;

                            // if (AudioManager.audioDisplaced) {
                            //   // Use the current index
                            //   metadata = audioMetadataList[index];
                            // } else {
                            //   // Use the index specified by AudioManager.post
                            //   metadata = audioMetadataList[AudioManager.post];
                            // }
                            // songPosition(index);

                            // AudioManager.audioDisplaced
                            //     ? metadata = audioMetadataList[index]
                            //     : metadata =
                            // audioMetadataList[AudioManager.post];

                            AudioModel audios = value.audioList[index];

                            final title = audios.title;
                            final artist = audios.artist;
                            final album = audios.album;
                            final genre = audios.genre;
                            final release = audios.release;
                            final audio = audios.audio;
                            final coverPhoto = audios.coverPhoto;
                            final id = audios.id;

                            // final title = metadata['Song Name'];
                            // final artist = metadata['Artiste'];
                            // final album = metadata['Album'];
                            // final genre = metadata['Genre'];
                            // final release = metadata['Release Date'];
                            // final audio = metadata['Audio File'];
                            // final coverPhoto = metadata['Cover Photo'];

                            final musicLists = value.audioList;

                            // addSong(
                            //   artist: artist,
                            //   songUrl: audio,
                            //   albumName: album,
                            //   songName: title,
                            //   coverPhoto: coverPhoto == null
                            //       ? 'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='
                            //       : coverPhoto,
                            // );

                            // Create a map for the current song
                            // Map<String, String> songMap = {
                            //   'artist': artist,
                            //   'songUrl': audio,
                            //   'albumName': album,
                            //   'songName': title,
                            //   'coverPhoto': coverPhoto == null
                            //       ? 'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='
                            //       : coverPhoto,
                            // };
                            //
                            // // Add the current song map to the list
                            // songsList.add(songMap);

                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink[300],
                                  borderRadius: BorderRadius.circular(15)),
                              width: 250,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image(
                                          height: 100,
                                          width: 100,
                                          image: NetworkImage(coverPhoto),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(artist)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.loop_outlined,
                                          color: Color.fromARGB(
                                              255, 244, 242, 242),
                                          size: 30),
                                      // Icon(Icons.skip_previous_outlined,
                                      //     color: Colors.white, size: 28),
                                      GestureDetector(
                                        onTap: () => {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .bottomToTop,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              child: currentPlay(
                                                index: index,
                                                musicList: musicLists,
                                              ),
                                            ),
                                          )
                                        },
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.white,
                                          size: 65,
                                        ),
                                      ),
                                      // Icon(Icons.skip_next_outlined,
                                      //     color: Colors.white, size: 28),
                                      Icon(Icons.volume_up_outlined,
                                          color: Colors.white, size: 30),
                                    ],
                                  )
                                ],
                              ),
                            );
                          })),
                ),
                // FutureBuilder<List<Map<String, String>>>(
                //   future: FirebaseApi().fetchAllAudioFiles('songs'),
                //   builder: (context, snapshot) {
                //     try {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return Center(
                //             child: CircularProgressIndicator(
                //           color: Colors.lightGreenAccent,
                //         ));
                //       }
                //
                //       if (snapshot.hasError) {
                //         throw snapshot.error!;
                //       }
                //
                //       final audioMetadataList = snapshot.data;
                //
                //       if (audioMetadataList!.isEmpty) {
                //         return Center(child: Text("No audio files found."));
                //       }
                //
                //       return Consumer<AudioManagement>(
                //           builder: (context, AudioManager, child) {
                //         return Container(
                //           height: 270,
                //           width: double.infinity,
                //           child: ListView.builder(
                //               shrinkWrap: true,
                //               scrollDirection: Axis.horizontal,
                //               itemCount: audioMetadataList.length,
                //               itemBuilder: ((context, index) {
                //                 Map<String, dynamic> metadata;
                //
                //                 // if (AudioManager.audioDisplaced) {
                //                 //   // Use the current index
                //                 //   metadata = audioMetadataList[index];
                //                 // } else {
                //                 //   // Use the index specified by AudioManager.post
                //                 //   metadata = audioMetadataList[AudioManager.post];
                //                 // }
                //
                //                 // songPosition(index);
                //
                //                 AudioManager.audioDisplaced
                //                     ? metadata = audioMetadataList[index]
                //                     : metadata =
                //                         audioMetadataList[AudioManager.post];
                //
                //                 final title = metadata['Song Name'];
                //                 final artist = metadata['Artiste'];
                //                 final album = metadata['Album'];
                //                 final genre = metadata['Genre'];
                //                 final release = metadata['Release Date'];
                //                 final audio = metadata['Audio File'];
                //                 final coverPhoto = metadata['Cover Photo'];
                //
                //                 // final musicList = audioMetadataList;
                //
                //                 // addSong(
                //                 //   artist: artist,
                //                 //   songUrl: audio,
                //                 //   albumName: album,
                //                 //   songName: title,
                //                 //   coverPhoto: coverPhoto == null
                //                 //       ? 'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='
                //                 //       : coverPhoto,
                //                 // );
                //
                //                 // Create a map for the current song
                //                 // Map<String, String> songMap = {
                //                 //   'artist': artist,
                //                 //   'songUrl': audio,
                //                 //   'albumName': album,
                //                 //   'songName': title,
                //                 //   'coverPhoto': coverPhoto == null
                //                 //       ? 'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='
                //                 //       : coverPhoto,
                //                 // };
                //                 //
                //                 // // Add the current song map to the list
                //                 // songsList.add(songMap);
                //
                //                 return Container(
                //                   decoration: BoxDecoration(
                //                       color: Colors.pink[300],
                //                       borderRadius: BorderRadius.circular(15)),
                //                   width: 250,
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal: 10, vertical: 15),
                //                   margin: const EdgeInsets.symmetric(
                //                       horizontal: 15, vertical: 15),
                //                   child: Column(
                //                     children: [
                //                       const SizedBox(
                //                         height: 10,
                //                       ),
                //                       Row(
                //                         children: [
                //                           ClipRRect(
                //                             borderRadius:
                //                                 BorderRadius.circular(10),
                //                             child: Image(
                //                               height: 100,
                //                               width: 100,
                //                               image: NetworkImage(coverPhoto ==
                //                                       null
                //                                   ? 'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='
                //                                   : coverPhoto),
                //                               fit: BoxFit.cover,
                //                             ),
                //                           ),
                //                           const SizedBox(
                //                             width: 10,
                //                           ),
                //                           Flexible(
                //                             child: Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: [
                //                                 Text(
                //                                   title!,
                //                                   style: TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                   ),
                //                                 ),
                //                                 SizedBox(
                //                                   height: 10,
                //                                 ),
                //                                 Text(artist!)
                //                               ],
                //                             ),
                //                           )
                //                         ],
                //                       ),
                //                       const SizedBox(
                //                         height: 35,
                //                       ),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Icon(Icons.loop_outlined,
                //                               color: Color.fromARGB(
                //                                   255, 244, 242, 242),
                //                               size: 30),
                //                           // Icon(Icons.skip_previous_outlined,
                //                           //     color: Colors.white, size: 28),
                //                           GestureDetector(
                //                             onTap: () => {
                //                               Navigator.push(
                //                                 context,
                //                                 PageTransition(
                //                                   type: PageTransitionType
                //                                       .bottomToTop,
                //                                   duration: const Duration(
                //                                       milliseconds: 300),
                //                                   child: currentPlay(
                //                                     index: index,
                //                                     musicList:
                //                                         audioMetadataList,
                //                                   ),
                //                                 ),
                //                               )
                //                             },
                //                             child: Icon(
                //                               Icons.play_circle,
                //                               color: Colors.white,
                //                               size: 65,
                //                             ),
                //                           ),
                //                           // Icon(Icons.skip_next_outlined,
                //                           //     color: Colors.white, size: 28),
                //                           Icon(Icons.volume_up_outlined,
                //                               color: Colors.white, size: 30),
                //                         ],
                //                       )
                //                     ],
                //                   ),
                //                 );
                //               })),
                //         );
                //       });
                //     } catch (error) {
                //       return Center(
                //           child: Container(
                //               color: Colors.deepOrangeAccent,
                //               child: Text("An error occurred: $error")));
                //     }
                //   },
                // )
              ],
            ),
          ),
        ),
      );
    });
  }

  // player(int count, bool isPlaying, Duration duration, Duration position) {
  //   int index = count;
  //   bool player = isPlaying;
  //
  //   Duration lengths = duration;
  //   Duration post = position;
  //
  //   // setState(() {});
  //
  //   void newDuration(int second) {
  //     Duration newDurations = Duration(seconds: second);
  //     audioPlayer.seek(newDurations);
  //   }
  //
  //   String networkImage =
  //       'https://img.buzzfeed.com/buzzfeed-static/complex/images/csay5rvhyzcfwy9hzkcx/wizkid.png?downsize=920:*&output-format=auto&output-quality=auto';
  //
  //   // https://guardian.ng/wp-content/uploads/2022/03/Rema-Rave-and-Roses-Album-1200x1200-1.jpeg
  //
  //   String networkImage2 =
  //       'https://guardian.ng/wp-content/uploads/2022/03/Rema-Rave-and-Roses-Album-1200x1200-1.jpeg';
  //
  //   String networkImage3 =
  //       'https://hiddenremote.com/files/image-exchange/2023/07/ie_105426.jpeg';
  //
  //   String networkImage4 =
  //       'https://pbs.twimg.com/media/DyGkj-cU0AAGLH-?format=jpg&name=4096x4096';
  //
  //   String networkImage5 =
  //       'https://www.bellanaija.com/wp-content/uploads/2022/07/293564498_1208386089976695_2249588927290283092_n.jpg';
  //
  //   String networkImage6 =
  //       'https://cdns-images.dzcdn.net/images/cover/a713fbee0c9e591de8b8b5a2f3a65c6b/500x500.jpg';
  //
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.transparent,
  //       isScrollControlled: true,
  //       builder: (context) {
  //         return StatefulBuilder(
  //             builder: (BuildContext context, StateSetter setState) {
  //           String pics = networkImage2;
  //           String artistname = 'Rema';
  //           String Albumname = 'rave and roses';
  //           String songname = 'Charm';
  //           return SizedBox(
  //             height: MediaQuery.of(context).size.height * 0.75,
  //             child: Stack(
  //               clipBehavior: Clip.none,
  //               children: [
  //                 Container(
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: NetworkImage(pics), fit: BoxFit.cover),
  //                     borderRadius: const BorderRadius.vertical(
  //                       top: Radius.circular(25),
  //                     ),
  //                     // color: Colors.tealAccent
  //                   ),
  //                   width: double.infinity,
  //                   height: double.infinity,
  //                   child: ClipRRect(
  //                     // make sure we apply clip it properly
  //                     child: BackdropFilter(
  //                       filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
  //                       // blendMode: BlendMode.saturation,
  //                     ),
  //                   ),
  //                 ),
  //                 Align(
  //                   alignment: Alignment.center,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(30),
  //                     child: Container(
  //                       height: double.infinity,
  //                       width: double.infinity,
  //                       decoration: BoxDecoration(
  //                         borderRadius: const BorderRadius.all(
  //                           Radius.circular(25),
  //                         ),
  //                         color: const Color(0xffC0C0C0).withOpacity(0.7),
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           Text(
  //                             artistname,
  //                             style: GoogleFonts.lato(
  //                                 fontSize: 12,
  //                                 fontWeight: FontWeight.w600,
  //                                 fontStyle: FontStyle.italic,
  //                                 color: Colors.blueGrey),
  //                           ),
  //                           SizedBox(
  //                             height: 180.h,
  //                             width: 150.w,
  //                             child: Image.network(pics),
  //                           ),
  //                           Text(
  //                             songname,
  //                             style: GoogleFonts.lato(
  //                                 fontSize: 28,
  //                                 fontWeight: FontWeight.w800,
  //                                 fontStyle: FontStyle.italic,
  //                                 color: Colors.black),
  //                           ),
  //                           Text(
  //                             Albumname.toUpperCase(),
  //                             style: GoogleFonts.lato(
  //                                 fontSize: 12,
  //                                 fontWeight: FontWeight.w600,
  //                                 fontStyle: FontStyle.normal,
  //                                 color: Colors.black),
  //                           ),
  //                           SizedBox(
  //                             child: Padding(
  //                               padding:
  //                                   const EdgeInsets.symmetric(horizontal: 10),
  //                               child: Column(
  //                                 children: [
  //                                   Slider(
  //                                       activeColor: Colors.white,
  //                                       min: 0,
  //                                       max: lengths.inSeconds.toDouble(),
  //                                       value: post.inSeconds.toDouble(),
  //                                       onChanged: ((value) {
  //                                         setState(() {
  //                                           newDuration(value.toInt());
  //                                           print(value.toInt());
  //                                           post = Duration(
  //                                               seconds: value.toInt());
  //                                         });
  //                                       })),
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceBetween,
  //                                     children: [
  //                                       Text(
  //                                         post.toString().split('.')[0],
  //                                         style: GoogleFonts.lato(
  //                                             fontSize: 12,
  //                                             color: Colors.black,
  //                                             fontWeight: FontWeight.bold),
  //                                       ),
  //                                       Text(
  //                                         lengths.toString().split('.')[0],
  //                                         style: GoogleFonts.lato(
  //                                             fontSize: 12,
  //                                             color: Colors.black,
  //                                             fontWeight: FontWeight.bold),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                   const SizedBox(
  //                                     height: 20,
  //                                   ),
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceEvenly,
  //                                     children: [
  //                                       // Icon(Icons.loop_outlined,
  //                                       //     color:
  //                                       //         Color.fromARGB(255, 244, 242, 242),
  //                                       //     size: 28),
  //                                       const Icon(Icons.skip_previous_outlined,
  //                                           color: Colors.white, size: 28),
  //                                       ElevatedButton(
  //                                         style: ElevatedButton.styleFrom(
  //                                             shape: RoundedRectangleBorder(
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(
  //                                                         10)),
  //                                             primary: Colors.black
  //                                                 .withOpacity(0.4)),
  //                                         onPressed: () {},
  //                                         // child: null,
  //                                         child: SizedBox(
  //                                           height: 55,
  //                                           width: 42,
  //                                           child: GestureDetector(
  //                                             onTap: (() async {
  //                                               print(player);
  //                                               if (player == false) {
  //                                                 await audioPlayer.resume();
  //                                                 setState(() {
  //                                                   player = true;
  //                                                 });
  //                                               } else {
  //                                                 await audioPlayer.pause();
  //                                                 setState(() {
  //                                                   player = false;
  //                                                 });
  //                                               }
  //                                             }),
  //                                             child: player
  //                                                 ? Icon(
  //                                                     Icons.play_circle,
  //                                                     color: Colors.white,
  //                                                     size: 42,
  //                                                   )
  //                                                 : Icon(
  //                                                     Icons.pause_circle,
  //                                                     color: Colors.white,
  //                                                     size: 42,
  //                                                   ),
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       GestureDetector(
  //                                         onTap: (() async {
  //                                           setState(() {
  //                                             index++;
  //
  //                                             if (index >= music.length) {
  //                                               index = 0;
  //                                             }
  //
  //                                             setAudio();
  //                                             newDuration(0);
  //
  //                                             isPlaying = false;
  //                                           });
  //                                         }),
  //                                         child: const Icon(
  //                                             Icons.skip_next_outlined,
  //                                             color: Colors.white,
  //                                             size: 28),
  //                                       ),
  //                                       // Icon(Icons.volume_up_outlined,
  //                                       //     color: Colors.white, size: 28),
  //                                     ],
  //                                   ),
  //                                   const SizedBox(
  //                                     height: 20,
  //                                   ),
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceBetween,
  //                                     children: const [
  //                                       Icon(Icons.playlist_add,
  //                                           color: Colors.white, size: 28),
  //                                       Icon(Icons.loop_outlined,
  //                                           color: Colors.white, size: 28),
  //                                       Icon(Icons.shuffle,
  //                                           color: Colors.white, size: 28),
  //                                       Icon(Icons.favorite_outline_sharp,
  //                                           color: Colors.white, size: 28),
  //                                       Icon(Icons.volume_up_outlined,
  //                                           color: Colors.white, size: 28),
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           );
  //         });
  //       });
  // }
}
