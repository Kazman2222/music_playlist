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

import '../artistesdetails/profile.dart';
import '../audio/current_play.dart';

class playlist extends StatefulWidget {
  const playlist({super.key});

  @override
  State<playlist> createState() => _playlistState();
}

class _playlistState extends State<playlist> {
  // final usero = FirebaseAuth.instance.currentUser!;
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isRepeat = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  List music = ['olamide.mp3', 'qdot.mp3', 'rock.mp3', 'sample.mp3'];

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
        if (count > music.length) {
          count = 0;
          setAudio();
        } else {
          count = count + 1;
          setAudio();
        }
      });

      // isPlaying = false;
      // await audioPlayer.resume();
    });
  }

  // void newDuration(int second) {
  //   Duration newDurations = Duration(seconds: second);
  //   audioPlayer.seek(newDurations);
  // }

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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            child: Text('J',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Your Playlist',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20))
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.search,
                          size: 29,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add,
                          size: 29,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Text(
                  'Recent',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Container(
                height: 230,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://media.istockphoto.com/id/1391397901/photo/contemporary-art-collage-stylish-silhouette-of-man-male-casual-fashion-isolated-over-abstract.jpg?s=612x612&w=0&k=20&c=qpP01m5xctaam9bWFYd58SrGw-lOmmZMiChN2ENo-DU='),
                                fit: BoxFit.cover)),
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 140, 140, 140)
                                  .withOpacity(0.9),
                          radius: 25,
                          child: GestureDetector(
                            onTap: () => {
                              // player(),
                              setState(() {
                                count = index;
                                setAudio();
                                isPlaying = false;
                                print(count);
                              }),
                              player(count, isPlaying, duration, position)
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
                    onPressed: (() {}),
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
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
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
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Image(
                                    height: 100,
                                    width: 100,
                                    image: NetworkImage(
                                        'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='),
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
                                    children: const [
                                      Text(
                                        'Steven Edisenn Elena',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Podcastly')
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Slider(
                                activeColor: Colors.white,
                                min: 0.0,
                                max: 100.0,
                                value: 20,
                                onChanged: ((value) {})),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '15:25',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('27:30',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.loop_outlined,
                                    color: Color.fromARGB(255, 244, 242, 242),
                                    size: 28),
                                Icon(Icons.skip_previous_outlined,
                                    color: Colors.white, size: 28),
                                GestureDetector(
                                  onTap: () => {
                                    // player(),
                                    // setState(() {
                                    //   count = index;
                                    //   setAudio();
                                    //   isPlaying = false;
                                    //   print(count);
                                    // }),
                                    // player(count, isPlaying, duration, position)

                                    // Navigator.pushNamed(context, 'playing'),

                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: const currentPlay(),
                                      ),
                                    )
                                  },
                                  child: Icon(
                                    Icons.play_circle,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                                Icon(Icons.skip_next_outlined,
                                    color: Colors.white, size: 28),
                                Icon(Icons.volume_up_outlined,
                                    color: Colors.white, size: 28),
                              ],
                            )
                          ],
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }

  player(int count, bool isPlaying, Duration duration, Duration position) {
    int index = count;
    bool player = isPlaying;

    Duration lengths = duration;
    Duration post = position;

    // setState(() {});

    void newDuration(int second) {
      Duration newDurations = Duration(seconds: second);
      audioPlayer.seek(newDurations);
    }

    String networkImage =
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

    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            String pics = networkImage2;
            String artistname = 'Rema';
            String Albumname = 'rave and roses';
            String songname = 'Charm';
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(pics), fit: BoxFit.cover),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
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
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: const Color(0xffC0C0C0).withOpacity(0.7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              artistname,
                              style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.blueGrey),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Slider(
                                        activeColor: Colors.white,
                                        min: 0,
                                        max: lengths.inSeconds.toDouble(),
                                        value: post.inSeconds.toDouble(),
                                        onChanged: ((value) {
                                          setState(() {
                                            newDuration(value.toInt());
                                            print(value.toInt());
                                            post = Duration(
                                                seconds: value.toInt());
                                          });
                                        })),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          post.toString().split('.')[0],
                                          style: GoogleFonts.lato(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          lengths.toString().split('.')[0],
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
                                        const Icon(Icons.skip_previous_outlined,
                                            color: Colors.white, size: 28),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              primary: Colors.black
                                                  .withOpacity(0.4)),
                                          onPressed: () {},
                                          // child: null,
                                          child: SizedBox(
                                            height: 55,
                                            width: 42,
                                            child: GestureDetector(
                                              onTap: (() async {
                                                print(player);
                                                if (player == false) {
                                                  await audioPlayer.resume();
                                                  setState(() {
                                                    player = true;
                                                  });
                                                } else {
                                                  await audioPlayer.pause();
                                                  setState(() {
                                                    player = false;
                                                  });
                                                }
                                              }),
                                              child: player
                                                  ? Icon(
                                                      Icons.play_circle,
                                                      color: Colors.white,
                                                      size: 42,
                                                    )
                                                  : Icon(
                                                      Icons.pause_circle,
                                                      color: Colors.white,
                                                      size: 42,
                                                    ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (() async {
                                            setState(() {
                                              index++;

                                              if (index >= music.length) {
                                                index = 0;
                                              }

                                              setAudio();
                                              newDuration(0);

                                              isPlaying = false;
                                            });
                                          }),
                                          child: const Icon(
                                              Icons.skip_next_outlined,
                                              color: Colors.white,
                                              size: 28),
                                        ),
                                        // Icon(Icons.volume_up_outlined,
                                        //     color: Colors.white, size: 28),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(Icons.playlist_add,
                                            color: Colors.white, size: 28),
                                        Icon(Icons.loop_outlined,
                                            color: Colors.white, size: 28),
                                        Icon(Icons.shuffle,
                                            color: Colors.white, size: 28),
                                        Icon(Icons.favorite_outline_sharp,
                                            color: Colors.white, size: 28),
                                        Icon(Icons.volume_up_outlined,
                                            color: Colors.white, size: 28),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
