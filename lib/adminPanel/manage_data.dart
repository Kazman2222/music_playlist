import 'dart:ui';

import 'package:audio_playlist/audio/player.dart';
import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:audio_playlist/components/buttons.dart';
import 'package:audio_playlist/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../api/firebase_api.dart';
import '../artistesdetails/profile.dart';
import '../audio/current_play.dart';
import '../popUps/utils.dart';

class manager extends StatefulWidget {
  const manager({Key? key}) : super(key: key);

  @override
  State<manager> createState() => _managerState();
}

class _managerState extends State<manager> {
  final usero = FirebaseAuth.instance.currentUser!;

  bool exit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColour,
      appBar: buildAppBars(
        text: 'Manage Your Music/Podcasts',
        onTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 10, bottom: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Uploaded Tracks',
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
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder<List<Map<String, String>>>(
                future: FirebaseApi().fetchAllAudioFiles('songs'),
                builder: (context, snapshot) {
                  try {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.lightGreenAccent,
                      ));
                    }

                    if (snapshot.hasError) {
                      throw snapshot.error!;
                    }

                    final audioMetadataList = snapshot.data;

                    if (audioMetadataList!.isEmpty) {
                      return Center(child: Text("No audio files found."));
                    }

                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      height: 280,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: audioMetadataList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            final metadata = audioMetadataList[index];
                            final title = metadata['Song Name'];
                            final artist = metadata['Artiste'];
                            final album = metadata['Album'];
                            final genre = metadata['Genre'];
                            final release = metadata['Release Date'];
                            final audio = metadata['Audio File'];
                            final coverPhoto = metadata['Cover Photo'];
                            final id = metadata['id'];

                            final coverPhotoDestination =
                                metadata['Pic Destination'];

                            final audioDestination = metadata['Destination'];

                            if (id == usero.email) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF0091EA).withOpacity(0.5),
                                        Color(0xFF80D8FF).withOpacity(0.5),
                                        Color(0xFFFFFFFF).withOpacity(0.5),
                                        Color(0xFF80D8FF).withOpacity(
                                            0.5), // Starting color (light blue)
                                        // Color(0xFF40C4FF).withOpacity(
                                        //     0.2), // Middle color (medium blue)
                                        Color(0xFF0091EA).withOpacity(
                                            0.5), // Ending color (darker blue)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.white.withOpacity(
                                    //         0.5), // Reflection color
                                    //     spreadRadius: 5,
                                    //     blurRadius: 7,
                                    //     offset: Offset(
                                    //         0, 3), // Offset for the reflection
                                    //   ),
                                    // ],
                                  ),
                                  width: 320,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              genre!,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image(
                                                  height: 135,
                                                  width: 125,
                                                  image: NetworkImage(coverPhoto ==
                                                          null
                                                      ? 'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='
                                                      : coverPhoto),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              // height: 50.h,
                                              // width: 150.w,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.transparent,
                                                    side: const BorderSide(
                                                        color: Colors.white,
                                                        width: 1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15))),
                                                onPressed: (() {
                                                  // setState(() {
                                                  //   _incrementCounter();
                                                  // });
                                                }),
                                                child: Text(
                                                  'Send to Audience',
                                                  style: GoogleFonts.raleway(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        // const SizedBox(
                                        //   width: 10,
                                        // ),
                                        SizedBox(
                                          width: 135,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  title!,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  artist!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  album!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors
                                                      .black, // Set the background color to black
                                                  content: Text(
                                                    "Do you want to delete this audio data?",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white), // Set text color to white
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      // Set button background color to green
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white), // Set button text color to white
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .green),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      // Set button background color to green
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white), // Set button text color to white
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .green),
                                                      ),
                                                      onPressed: () {
                                                        // Add your delete logic here
                                                        deleteExistingProfilePhoto(
                                                            coverPhotoDestination!,
                                                            audioDestination!);
                                                        Utils.showSnackBar(
                                                            'Audio File Deleted!');
                                                        // After deleting, you can use Navigator.of(context).pop() to close the AlertDialog
                                                        // This is a placeholder for the delete action
                                                        print(
                                                            "Audio data deleted!");
                                                        setState(() {
                                                          exit = true;
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (exit) {
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          child: Icon(Icons.delete_rounded,
                                              color: Colors.lightGreenAccent,
                                              size: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          })),
                    );
                  } catch (error) {
                    return Center(
                        child: Container(
                            color: Colors.deepOrangeAccent,
                            child: Text("An error occurred: $error")));
                  }
                }),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 10, bottom: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Uploaded Podcasts',
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
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder<List<Map<String, String>>>(
                future: FirebaseApi().fetchAllAudioFiles('podcasts'),
                builder: (context, snapshot) {
                  try {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.lightGreenAccent,
                      ));
                    }
                    if (snapshot.hasError) {
                      throw snapshot.error!;
                    }

                    final audioMetadataList = snapshot.data;

                    if (audioMetadataList!.isEmpty) {
                      return Center(child: Text("No audio files found."));
                    }

                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      height: 280,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: audioMetadataList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            final metadata = audioMetadataList[index];
                            final title = metadata['Titles'];
                            final host = metadata['Host'];
                            final description = metadata['Description'];
                            final EpTitle = metadata['Episode Title'];
                            final genre = metadata['Genre'];
                            final release = metadata['Release Date'];
                            final audio = metadata['Audio File'];
                            final coverPhoto = metadata['Cover Photo'];

                            final id = metadata['id'];

                            final coverPhotoDestination =
                                metadata['Pic Destination'];

                            final audioDestination = metadata['Destination'];

                            if (id == usero.email) {
                              return InkWell(
                                splashColor: Colors.yellowAccent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.transparent,
                                        Color(0xFFFFFFFF).withOpacity(0.2),
                                        Color(0xFFFFFFFF).withOpacity(0.6),
                                        Color(0xFFFFFFFF).withOpacity(
                                            0.2), // Starting color (light blue)
                                        // Color(0xFF40C4FF).withOpacity(
                                        //     0.2), // Middle color (medium blue)
                                        Colors
                                            .transparent, // Ending color (darker blue)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.white.withOpacity(
                                    //         0.5), // Reflection color
                                    //     spreadRadius: 5,
                                    //     blurRadius: 7,
                                    //     offset: Offset(
                                    //         0, 3), // Offset for the reflection
                                    //   ),
                                    // ],
                                  ),
                                  width: 320,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              genre!,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image(
                                                  height: 135,
                                                  width: 125,
                                                  image: NetworkImage(coverPhoto ==
                                                          null
                                                      ? 'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='
                                                      : coverPhoto),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(
                                        //   width: 10,
                                        // ),
                                        SizedBox(
                                          width: 135,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  host!,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  title!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  description!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  EpTitle!,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors
                                                      .black, // Set the background color to black
                                                  content: Text(
                                                    "Do you want to delete this audio data?",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white), // Set text color to white
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      // Set button background color to green
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white), // Set button text color to white
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .green),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      // Set button background color to green
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white), // Set button text color to white
                                                      ),
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .green),
                                                      ),
                                                      onPressed: () {
                                                        // Add your delete logic here
                                                        deleteExistingProfilePhoto(
                                                            coverPhotoDestination!,
                                                            audioDestination!);
                                                        Utils.showSnackBar(
                                                            'Audio File Deleted!');
                                                        // After deleting, you can use Navigator.of(context).pop() to close the AlertDialog
                                                        // This is a placeholder for the delete action
                                                        print(
                                                            "Audio data deleted!");
                                                        setState(() {
                                                          exit = true;
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (exit) {
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          child: Icon(Icons.delete_rounded,
                                              color: Colors.lightGreenAccent,
                                              size: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          })),
                    );
                  } catch (error) {
                    return Center(
                        child: Container(
                            color: Colors.deepOrangeAccent,
                            child: Text("An error occurred: $error")));
                  }
                }),
          ],
        ),
      ),
    );
  }

  Future<void> deleteExistingProfilePhoto(
      String picturefileLocay, String fileLocay) async {
    try {
      final audioReference = FirebaseStorage.instance.ref().child('$fileLocay');
      final imageReference =
          FirebaseStorage.instance.ref().child('$picturefileLocay');
      audioReference.delete();
      imageReference.delete();
    } catch (e) {
      print('Error deleting existing Music Data: $e');
    }
  }
}

// Icon(Icons.delete_rounded,
//     color: Colors.white, size: 30),
