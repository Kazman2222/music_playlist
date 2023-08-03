import 'dart:ui';

import 'package:audio_playlist/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volume_controller/volume_controller.dart';

class currentPlay extends StatefulWidget {
  const currentPlay({Key? key}) : super(key: key);

  @override
  State<currentPlay> createState() => _currentPlayState();
}

class _currentPlayState extends State<currentPlay> {
  String networkImage0 =
      'https://img.buzzfeed.com/buzzfeed-static/complex/images/csay5rvhyzcfwy9hzkcx/wizkid.png?downsize=920:*&output-format=auto&output-quality=auto';

  // https://guardian.ng/wp-content/uploads/2022/03/Rema-Rave-and-Roses-Album-1200x1200-1.jpeg

  String networkImage2 =
      'https://guardian.ng/wp-content/uploads/2022/03/Rema-Rave-and-Roses-Album-1200x1200-1.jpeg';

  String networkImage3 =
      'https://hiddenremote.com/files/image-exchange/2023/07/ie_105426.jpeg';

  String networkImage4 =
      'https://pbs.twimg.com/media/DyGkj-cU0AAGLH-?format=jpg&name=4096x4096';

  String networkImage5 =
      'https://www.bellanaija.com/wp-content/uploads/2022/07/293564498_1208386089976695_2249588927290283092_n.jpg';

  String networkImage6 =
      'https://cdns-images.dzcdn.net/images/cover/a713fbee0c9e591de8b8b5a2f3a65c6b/500x500.jpg';

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isRepeat = false;
  bool fav = false;
  bool shuffle = false;
  bool playlist = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  List music = ['olamide.mp3', 'qdot.mp3', 'rock.mp3', 'sample.mp3'];

  double _volumeListenerValue = 0;
  double _getVolume = 0;
  double _setVolumeValue = 0;
  bool tapper = false;
  // late String networkImage;

  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) async {
      setState(() {
        count++;
        if (count > music.length) {
          count = 0;
          // setAudio();
        }

        newDuration(0);
        setAudio();
      });

      // isPlaying = false;
      // await audioPlayer.resume();
    });

    VolumeController().listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });

    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  void newDuration(int second) {
    Duration newDurations = Duration(seconds: second);
    audioPlayer.seek(newDurations);
  }

  int count = 0;

  Future setAudio() async {
    final player = AudioCache(prefix: 'lib/audio/');
    final url = await player.load(music[count]);
    audioPlayer.setSourceUrl(url.path);
    //if (isPlaying != false) {
    //  audioPlayer.resume();
    //  }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    VolumeController().removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String pics = networkImage4;
    String artistname = 'Wizkid';
    String Albumname = 'More Love, Less Ego';
    String songname = 'Bad 2 Me';
    return Scaffold(
      backgroundColor: kBackGroundColour,
      body: SafeArea(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height * 0.75,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(pics), fit: BoxFit.cover),
                  // color: Colors.tealAccent
                ),
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    // blendMode: BlendMode.saturation,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                      color: const Color(0xffC0C0C0).withOpacity(0.7),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          artistname,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 180.h,
                          width: 150.w,
                          child: Image.network(pics),
                        ),
                        Text(
                          songname,
                          style: GoogleFonts.lato(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.italic,
                              color: Colors.black),
                        ),
                        Text(
                          Albumname.toUpperCase(),
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Slider(
                                  activeColor: Colors.white,
                                  min: 0,
                                  max: duration.inSeconds.toDouble(),
                                  value: position.inSeconds.toDouble(),
                                  onChanged: ((value) {
                                    setState(() {
                                      newDuration(value.toInt());
                                    });
                                  }),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      position.toString().split('.')[0],
                                      style: GoogleFonts.lato(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      duration.toString().split('.')[0],
                                      style: GoogleFonts.lato(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Icon(Icons.loop_outlined,
                                    //     color:
                                    //         Color.fromARGB(255, 244, 242, 242),
                                    //     size: 28),
                                    GestureDetector(
                                      onTap: (() async {
                                        setState(() {
                                          count--;

                                          if (count >= music.length) {
                                            count = 0;
                                          }

                                          setAudio();
                                          newDuration(0);

                                          isPlaying = true;
                                        });
                                      }),
                                      // child: const Icon(
                                      //     Icons.skip_previous_outlined,
                                      //     color: Colors.white,
                                      //     size: 28),
                                      child: Image.asset(
                                        'assets/favicons/fast-backward.png',
                                        height: 45.h,
                                        width: 70.w,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          primary:
                                              Colors.black.withOpacity(0.4)),
                                      onPressed: () {},
                                      // child: null,
                                      child: SizedBox(
                                        height: 55,
                                        width: 42,
                                        child: GestureDetector(
                                          onTap: (() async {
                                            // print(player);
                                            if (isPlaying == false) {
                                              await audioPlayer.resume();
                                              setState(() {
                                                isPlaying = true;
                                              });
                                            } else {
                                              await audioPlayer.pause();
                                              setState(() {
                                                isPlaying = false;
                                              });
                                            }
                                          }),
                                          child: isPlaying
                                              ? const Icon(
                                                  Icons.pause_circle,
                                                  color: Colors.white,
                                                  size: 42,
                                                )
                                              : const Icon(
                                                  Icons.play_circle,
                                                  color: Colors.white,
                                                  size: 42,
                                                ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (() async {
                                        setState(() {
                                          count++;

                                          if (count >= music.length) {
                                            count = 0;
                                            // isPlaying = false;
                                          }

                                          setAudio();
                                          newDuration(0);

                                          //isPlaying = false;
                                        });
                                      }),
                                      // child: const Icon(
                                      //     Icons.skip_next_outlined,
                                      //     color: Colors.white,
                                      //     size: 28),
                                      child: Image.asset(
                                        'assets/favicons/fast-forward.png',
                                        height: 45.h,
                                        width: 70.w,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    // Icon(Icons.volume_up_outlined,
                                    //     color: Colors.white, size: 28),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (() {
                                        if (playlist == false) {
                                          // audioPlayer
                                          //     .setReleaseMode(ReleaseMode.loop);
                                          setState(() {
                                            playlist = true;
                                          });
                                        } else {
                                          // audioPlayer.setReleaseMode(
                                          //     ReleaseMode.release);
                                          setState(() {
                                            playlist = false;
                                          });
                                        }
                                      }),
                                      child: Icon(Icons.playlist_add,
                                          color: playlist
                                              ? Colors.greenAccent
                                              : Colors.white,
                                          size: 34),
                                    ),
                                    GestureDetector(
                                      onTap: (() {
                                        if (isRepeat == false) {
                                          audioPlayer
                                              .setReleaseMode(ReleaseMode.loop);
                                          setState(() {
                                            isRepeat = true;
                                          });
                                        } else {
                                          audioPlayer.setReleaseMode(
                                              ReleaseMode.release);
                                          setState(() {
                                            isRepeat = false;
                                          });
                                        }
                                      }),
                                      child: Icon(Icons.loop_outlined,
                                          color: isRepeat
                                              ? Colors.greenAccent
                                              : Colors.white,
                                          size: 34),
                                    ),
                                    GestureDetector(
                                      onTap: (() {
                                        if (shuffle == false) {
                                          // audioPlayer
                                          //     .setReleaseMode(ReleaseMode.loop);
                                          setState(() {
                                            shuffle = true;
                                          });
                                        } else {
                                          // audioPlayer.setReleaseMode(
                                          //     ReleaseMode.release);
                                          setState(() {
                                            shuffle = false;
                                          });
                                        }
                                      }),
                                      child: Icon(Icons.shuffle,
                                          color: shuffle
                                              ? Colors.greenAccent
                                              : Colors.white,
                                          size: 34),
                                    ),
                                    GestureDetector(
                                      onTap: (() {
                                        if (fav == false) {
                                          // audioPlayer
                                          //     .setReleaseMode(ReleaseMode.loop);
                                          setState(() {
                                            fav = true;
                                          });
                                        } else {
                                          // audioPlayer.setReleaseMode(
                                          //     ReleaseMode.release);
                                          setState(() {
                                            fav = false;
                                          });
                                        }
                                      }),
                                      child: Icon(
                                          fav
                                              ? Icons.favorite
                                              : Icons.favorite_outline_sharp,
                                          color: fav
                                              ? Colors.pinkAccent
                                              : Colors.white,
                                          size: 34),
                                    )
                                    // Icon(Icons.volume_up_outlined,
                                    //     color: Colors.white, size: 28),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      // onTap: () => setState(() {
                                      //   tapper = !tapper;
                                      // }),
                                      onTap: () {
                                        setState(() {
                                          tapper = !tapper;
                                          // handleVolume();
                                          if (tapper == true) {
                                            _setVolumeValue = 0;
                                            VolumeController().muteVolume();
                                          } else {
                                            _setVolumeValue = 1;
                                            VolumeController().maxVolume();
                                          }
                                        });
                                      },
                                      child: Icon(
                                          tapper
                                              ? Icons.volume_off_outlined
                                              : Icons.volume_up_outlined,
                                          color: Colors.white,
                                          size: 45),
                                    ),
                                    Flexible(
                                      child: Slider(
                                        min: 0,
                                        max: 1,
                                        activeColor: Colors.white,
                                        onChanged: (double value) {
                                          setState(() {
                                            _setVolumeValue = value;
                                            VolumeController()
                                                .setVolume(_setVolumeValue);
                                            _setVolumeValue == 0
                                                ? tapper = true
                                                : tapper = false;
                                          });
                                        },
                                        value: _setVolumeValue,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/favicons/down-arrow.png',
                  height: 50,
                  width: 70,
                  color: Colors.green.withOpacity(0.7),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
